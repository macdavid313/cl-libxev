;;;; async.lisp
(in-package #:cl-user)

(defpackage #:cl-libxev.examples.async
  (:use #:cl #:ff #:libxev)
  (:export #:main))

(in-package #:cl-libxev.examples.async)

(defun-foreign-callable timer-callback ((lp (* xev-loop))
                                        (c (* xev-completion))
                                        (result :int)
                                        (userdata (* :void)))
  (declare (:returning xev-cb-action)
           (ignore lp c result))
  ;; Send the notification to our async which will wake up the loop and
  ;; call the waiter callback.
  (xev-async-notify userdata)
  +XEV-DISARM+)

(defun-foreign-callable async-callback ((lp (* xev-loop))
                                        (c (* xev-completion))
                                        (result :int)
                                        (userdata (* :void)))
  (declare (:returning xev-cb-action)
           (ignore lp c result))
  (setf (fslot-value-typed :char :c userdata) 1)
  +XEV-DISARM+)

(defun main ()
  (with-static-fobjects ((lp 'xev-loop :allocation :c)
                         (async-c 'xev-completion :allocation :c)
                         (async 'xev-watcher :allocation :c)
                         (notified :char :allocation :c)
                         (timer-c 'xev-completion :allocation :c)
                         (timer 'xev-watcher :allocation :c))
    (unwind-protect
         (progn
           (when (not (zerop (xev-loop-init lp)))
             (error "xev-loop-init failure"))

           ;; Initialize an async watcher. An async watcher can be used to wake up
           ;; the event loop from any thread.
           (when (not (zerop (xev-async-init async)))
             (error "xev-async-init failure"))

           ;; We start a "waiter" for the async watcher. Only one waiter can
           ;; ever be set at a time. This callback will be called when the async
           ;; is notified (via xev_async_notify).
           (setf (fslot-value-typed :char :c notified) 0)
           (xev-async-wait async lp async-c notified (register-foreign-callable 'async-callback))

           ;; Initialize a timer. The timer will fire our async.
           (when (not (zerop (xev-timer-init timer)))
             (error "xev-timer-init failure"))
           (xev-timer-run timer lp timer-c 1 async (register-foreign-callable 'timer-callback))

           ;; Run the loop until there are no more completions. This means
           ;; that both the async watcher AND the timer have to complete.
           ;; Notice that if you comment out `xev_async_notify` in the timer
           ;; callback this blocks forever (because the async watcher is waiting).
           (xev-loop-run lp +XEV-RUN-UNTIL-DONE+)

           (when (zerop (fslot-value-typed :char :c notified))
             (error "FAIL! async should've been notified!")))
      ;; clean up
      (xev-timer-deinit timer)
      (xev-async-deinit async)
      (xev-loop-deinit lp))))
