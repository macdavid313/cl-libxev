;;;; basic.lisp
(in-package #:cl-user)

(defpackage #:cl-libxev.examples.basic
  (:use #:cl #:ff #:libxev)
  (:export #:main))

(in-package #:cl-libxev.examples.basic)

(defun-foreign-callable timer-callback ((lp (* xev-loop))
                                        (c (* xev-completion))
                                        (result :int)
                                        (userdata (* void)))
  (declare (:returning xev-cb-action)
           (ignore lp c result userdata))
  +XEV-DISARM+)

(defun main ()
  (with-stack-fobjects ((lp 'xev-loop)
                        (c 'xev-completion)
                        (w 'xev-watcher))
    (unwind-protect
         (progn
           ;; Initialize the loop state. Notice we can use a stack-allocated
           ;; value here. We can even pass around the loop by value! The loop
           ;; will contain all of our "completions" (watches).
           (when (not (zerop (xev-loop-init lp)))
             (error "xev-loop-init failure"))

           ;; Initialize a completion and a watcher. A completion is the actual
           ;; thing a loop does for us, and a watcher is a high-level structure
           ;; to help make it easier to use completions.
           ;; In this case, we initialize a timer watcher.
           (when (not (zerop (xev-timer-init w)))
             (error "xev-timer-init failure"))

           ;; Configure the timer to run in 1ms. This requires the completion that
           ;; we actually configure to become a timer, and the loop that the
           ;; completion should be registered with.
           (xev-timer-run w lp c 1 0 (register-foreign-callable 'timer-callback))

           ;; Run the loop until there are no more completions.
           (xev-loop-run lp +XEV-RUN-UNTIL-DONE+))
      ;; clean up
      (xev-timer-deinit w)
      (xev-loop-deinit lp))))
