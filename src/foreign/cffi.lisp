;;;; cffi.lisp
(in-package #:cl-libxev)

(eval-when (:compile-toplevel)
  (declaim (optimize (speed 3) (safety 1) (space 0))))

(cffi:defcfun (xev-loop-init "xev_loop_init") :int
  (lp (:pointer xev-loop)))

(cffi:defcfun (xev-loop-deinit "xev_loop_deinit") :void
  (lp (:pointer xev-loop)))

(cffi:defcfun (xev-loop-run "xev_loop_run") :int
  (lp (:pointer xev-loop))
  (mode xev-run-mode-t))

(cffi:defcfun (xev-loop-now "xev_loop_now") :int64
  (lp (:pointer xev-loop)))

(cffi:defcfun (xev-loop-update-now "xev_loop_update_now") :void
  (lp (:pointer xev-loop)))

(cffi:defcfun (xev-completion-zero "xev_completion_zero") :void
  (c (:pointer xev-completion)))

(cffi:defcfun (xev-completion-state "xev_completion_state") xev-completion-state-t
  (c (:pointer xev-completion)))

(cffi:defcfun (xev-threadpool-config-init "xev_threadpool_config_init") :void
  (config (:pointer xev-threadpool-config)))

(cffi:defcfun (xev-threadpool-config-set-stack-size "xev_threadpool_config_set_stack_size") :void
  (config (:pointer xev-threadpool-config))
  (v :uint32))

(cffi:defcfun (xev-threadpool-config-set-max-threads "xev_threadpool_config_set_max_threads") :void
  (config (:pointer xev-threadpool-config))
  (v :uint32))

(cffi:defcfun (xev-threadpool-init "xev_threadpool_init") :int
  (pool (:pointer xev-threadpool))
  (config (:pointer xev-threadpool-config)))

(cffi:defcfun (xev-threadpool-deinit "xev_threadpool_deinit") :void
  (pool (:pointer xev-threadpool)))

(cffi:defcfun (xev-threadpool-shutdown "xev_threadpool_shutdown") :void
  (pool (:pointer xev-threadpool)))

(cffi:defcfun (xev-threadpool-schedule "xev_threadpool_schedule") :void
  (pool (:pointer xev-threadpool))
  (batch (:pointer xev-threadpool-batch)))

(cffi:defcfun (xev-threadpool-task-init "xev_threadpool_task_init") :void
  (task (:pointer xev-threadpool-task))
  (cb :pointer))

(cffi:defcfun (xev-threadpool-batch-init "xev_threadpool_batch_init") :void
  (b (:pointer xev-threadpool-batch)))

(cffi:defcfun (xev-threadpool-batch-push-task "xev_threadpool_batch_push_task") :void
  (b (:pointer xev-threadpool-batch))
  (task (:pointer xev-threadpool-task)))

(cffi:defcfun (xev-threadpool-batch-push-batch "xev_threadpool_batch_push_batch") :void
  (b (:pointer xev-threadpool-batch))
  (other (:pointer xev-threadpool-batch)))

(cffi:defcfun (xev-timer-init "xev_timer_init") :int
  (w (:pointer xev-watcher)))

(cffi:defcfun (xev-timer-deinit "xev_timer_deinit") :void
  (w (:pointer xev-watcher)))

(cffi:defcfun (xev-timer-run "xev_timer_run") :void
  (w (:pointer xev-watcher))
  (lp (:pointer xev-loop))
  (c (:pointer xev-completion))
  (next-ms :uint64)
  (userdata :pointer)
  (cb :pointer))

(cffi:defcfun (xev-timer-reset "xev_timer_reset") :void
  (w (:pointer xev-watcher))
  (lp (:pointer xev-loop))
  (c (:pointer xev-completion))
  (c-cancel (:pointer xev-completion))
  (next-ms :uint64)
  (userdata :pointer)
  (cb :pointer))

(cffi:defcfun (xev-timer-cancel "xev_timer_cancel") :void
  (w (:pointer xev-watcher))
  (lp (:pointer xev-loop))
  (c (:pointer xev-completion))
  (c-cancel (:pointer xev-completion))
  (userdata :pointer)
  (cb :pointer))

(cffi:defcfun (xev-async-init "xev_async_init") :int
  (w (:pointer xev-watcher)))

(cffi:defcfun (xev-async-deinit "xev_async_deinit") :void
  (w (:pointer xev-watcher)))

(cffi:defcfun (xev-async-notify "xev_async_notify") :int
  (w (:pointer xev-watcher)))

(cffi:defcfun (xev-async-wait "xev_async_wait") :void
  (w (:pointer xev-watcher))
  (lp (:pointer xev-loop))
  (c (:pointer xev-completion))
  (userdata :pointer)
  (cb :pointer))
