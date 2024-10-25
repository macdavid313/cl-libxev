;;;; package.lisp
(in-package #:cl-user)

(defpackage #:cl-libxev
  (:use #:cl)
  (:nicknames #:libxev)
  ;; Opaque types
  (:export #:xev-loop
           #:xev-completion
           #:xev-watcher
           #:xev-threadpool
           #:xev-threadpool-batch
           #:xev-threadpool-task
           #:xev-threadpool-config)
  ;; Callback types
  (:export #:xev-cb-action
           #:+XEV-DISARM+
           #:+XEV-REARM+

           #:xev-run-mode-t
           #:+XEV-RUN-NO-WAIT+
           #:+XEV-RUN-ONCE+
           #:+XEV-RUN-UNTIL-DONE+

           #:xev-completion-state-t
           #:XEV-COMPLETION-DEAD+
           #:XEV-COMPLETION-ACTIVE+)
  ;; APIs
  (:export #:xev-loop-init
           #:xev-loop-deinit
           #:xev-loop-run
           #:xev-loop-now
           #:xev-loop-update-now

           #:xev-completion-zero
           #:xev-completion-state

           #:xev-threadpool-config-init
           #:xev-threadpool-config-set-stack-size
           #:xev-threadpool-config-set-max-threads

           #:xev-threadpool-init
           #:xev-threadpool-deinit
           #:xev-threadpool-shutdown
           #:xev-threadpool-schedule

           #:xev-threadpool-task-init
           #:xev-threadpool-batch-init
           #:xev-threadpool-batch-push-task
           #:xev-threadpool-batch-push-batch

           #:xev-timer-init
           #:xev-timer-deinit
           #:xev-timer-run
           #:xev-timer-reset
           #:xev-timer-cancel

           #:xev-async-init
           #:xev-async-deinit
           #:xev-async-notify
           #:xev-async-wait))
