;;;; allegro.lisp
(in-package #:cl-libxev)

(eval-when (:compile-toplevel)
  (declaim (optimize (speed 3) (safety 1) (space 0))))

(ff:def-foreign-call (xev-loop-init "xev_loop_init") ((lp (* xev-loop)))
  :returning :int
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-loop-deinit "xev_loop_deinit") ((lp (* xev-loop)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-loop-run "xev_loop_run") ((lp (* xev-loop))
                                                    (mode xev-run-mode-t))
  :returning :int
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-loop-now "xev_loop_now") ((lp (* xev-loop)))
  :returning :long-long
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-loop-update-now "xev_loop_update_now") ((lp (* xev-loop)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-completion-zero "xev_completion_zero") ((c (* xev-completion)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-completion-state "xev_completion_state") ((c (* xev-completion)))
  :returning xev-completion-state-t
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-threadpool-config-init "xev_threadpool_config_init") ((config (* xev-threadpool-config)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-threadpool-config-set-stack-size "xev_threadpool_config_set_stack_size") ((config (* xev-threadpool-config)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-threadpool-config-set-max-threads "xev_threadpool_config_set_max_threads") ((config (* xev-threadpool-config)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-threadpool-init "xev_threadpool_init") ((pool (* xev-threadpool))
                                                                  (config (* xev-threadpool-config)))
  :returning :int
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-threadpool-deinit "xev_threadpool_deinit") ((pool (* xev-threadpool)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-threadpool-shutdown "xev_threadpool_shutdown") ((pool (* xev-threadpool)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-threadpool-schedule "xev_threadpool_schedule") ((pool (* xev-threadpool))
                                                                          (batch (* xev-threadpool-batch)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-threadpool-task-init "xev_threadpool_task_init") ((task (* xev-threadpool-task))
                                                                            (cb (* :void)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-threadpool-batch-init "xev_threadpool_batch_init") ((b (* xev-threadpool-batch)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-threadpool-batch-push-task "xev_threadpool_batch_push_task") ((b (* xev-threadpool-batch))
                                                                                        (task (* xev-threadpool-task)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-threadpool-batch-push-batch "xev_threadpool_batch_push_batch") ((b (* xev-threadpool-batch))
                                                                                          (other (* xev-threadpool-batch)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-timer-init "xev_timer_init") ((w (* xev-watcher)))
  :returning :int
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-timer-deinit "xev_timer_deinit") ((w (* xev-watcher)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-timer-run "xev_timer_run") ((w (* xev-watcher))
                                                      (lp (* xev-loop))
                                                      (c (* xev-completion))
                                                      (next-ms :unsigned-long-long)
                                                      (userdata (* :void))
                                                      (cb (* :void)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-timer-reset "xev_timer_reset") ((w (* xev-watcher))
                                                          (lp (* xev-loop))
                                                          (c (* xev-completion))
                                                          (c-cacnel (* xev-completion))
                                                          (next-ms :unsigned-long-long)
                                                          (userdata (* :void))
                                                          (cb (* :void)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-timer-cancel "xev_timer_cancel") ((w (* xev-watcher))
                                                            (lp (* xev-loop))
                                                            (c (* xev-completion))
                                                            (c-cacnel (* xev-completion))
                                                            (userdata (* :void))
                                                            (cb (* :void)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-async-init "xev_async_init") ((w (* xev-watcher)))
  :returning :int
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-async-deinit "xev_async_deinit") ((w (* xev-watcher)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-async-notify "xev_async_notify") ((w (* xev-watcher)))
  :returning :int
  :strings-convert nil
  :call-direct t
  :arg-checking nil)

(ff:def-foreign-call (xev-async-wait "xev_async_wait") ((w (* xev-watcher))
                                                        (lp (* xev-loop))
                                                        (c (* xev-completion))
                                                        (userdata (* void))
                                                        (cb (* :void)))
  :returning :void
  :strings-convert nil
  :call-direct t
  :arg-checking nil)
