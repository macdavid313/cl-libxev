;;;; cl-libxev.asd
(in-package #:asdf-user)

(defsystem cl-libxev
  :version "0.1.0"
  :license "MIT"
  :author "Tianyu Gu <gty@CLOS.org>"
  :maintainer "Tianyu Gu <gty@CLOS.org>"
  :description "Common Lisp binding to libxev: a high performance, cross-platform event loop."
  :homepage "https://github.com/macdavid313/cl-libxev"
  :depends-on #+allegro () #+(not allegro) (#:cffi)
  :serial t
  :components ((:file "src/package")
               (:file "src/grovel/x86_64-linux/grovel"  :if-feature (:and :x86-64 :linux))
               (:file "src/grovel/aarch64-linux/grovel" :if-feature (:and :arm64 :linux))
               (:file "src/grovel/aarch64-macos/grovel" :if-feature (:and :arm64 :macos))
               (:file "src/foreign")
               (:file "src/libxev")))
