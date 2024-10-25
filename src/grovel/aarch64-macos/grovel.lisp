;;;; grovel.cl
;;;; DO NOT MODIFY: this file has been automatically generated.
(in-package #:cl-libxev)

;;; Opaque types.
#+allegro (ff:def-foreign-type xev-loop (:array :unsigned-char 512))
#-allegro (cffi:defctype xev-loop (:array :unsigned-char 512))
#+allegro (ff:def-foreign-type xev-completion (:array :unsigned-char 320))
#-allegro (cffi:defctype xev-completion (:array :unsigned-char 320))
#+allegro (ff:def-foreign-type xev-watcher (:array :unsigned-char 256))
#-allegro (cffi:defctype xev-watcher (:array :unsigned-char 256))
#+allegro (ff:def-foreign-type xev-threadpool (:array :unsigned-char 64))
#-allegro (cffi:defctype xev-threadpool (:array :unsigned-char 64))
#+allegro (ff:def-foreign-type xev-threadpool-batch (:array :unsigned-char 24))
#-allegro (cffi:defctype xev-threadpool-batch (:array :unsigned-char 24))
#+allegro (ff:def-foreign-type xev-threadpool-task (:array :unsigned-char 24))
#-allegro (cffi:defctype xev-threadpool-task (:array :unsigned-char 24))
#+allegro (ff:def-foreign-type xev-threadpool-config (:array :unsigned-char 64))
#-allegro (cffi:defctype xev-threadpool-config (:array :unsigned-char 64))

;;; Callback types.
#+allegro (ff:def-foreign-type xev-cb-action :int)
#-allegro (cffi:defctype xev-cb-action :int)
(defconstant +XEV-DISARM+ 0)
(defconstant +XEV-REARM+ 0)

#+allegro (ff:def-foreign-type xev-run-mode-t :int)
#-allegro (cffi:defctype xev-run-mode-t :int)
(defconstant +XEV-RUN-NO-WAIT+ 0)
(defconstant +XEV-RUN-ONCE+ 1)
(defconstant +XEV-RUN-UNTIL-DONE+ 2)

#+allegro (ff:def-foreign-type xev-completion-state-t :int)
#-allegro (cffi:defctype xev-completion-state-t :int)
(defconstant +XEV-COMPLETION-DEAD+ 0)
(defconstant +XEV-COMPLETION-ACTIVE+ 1)

