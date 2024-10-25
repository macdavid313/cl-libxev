#include <stdint.h>
#include <stdio.h>

#include <xev.h>

int
main (int argc, char **argv)
{
  FILE *output = argc > 1 ? fopen (argv[1], "w") : stdout;

  fputs (";;;; grovel.cl\n", output);
  fputs (";;;; DO NOT MODIFY: this file has been automatically generated.\n",
         output);
  fputs ("(in-package #:cl-libxev)\n\n", output);

  fputs (";;; Opaque types.\n", output);
  fprintf (output,
           "#+allegro (ff:def-foreign-type xev-loop (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_loop));
  fprintf (output,
           "#-allegro (cffi:defctype xev-loop (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_loop));
  fprintf (output,
           "#+allegro (ff:def-foreign-type xev-completion (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_completion));
  fprintf (output,
           "#-allegro (cffi:defctype xev-completion (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_completion));
  fprintf (output,
           "#+allegro (ff:def-foreign-type xev-watcher (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_watcher));
  fprintf (output,
           "#-allegro (cffi:defctype xev-watcher (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_watcher));
  fprintf (output,
           "#+allegro (ff:def-foreign-type xev-threadpool (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_threadpool));
  fprintf (output,
           "#-allegro (cffi:defctype xev-threadpool (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_threadpool));
  fprintf (output,
           "#+allegro (ff:def-foreign-type xev-threadpool-batch (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_threadpool_batch));
  fprintf (output,
           "#-allegro (cffi:defctype xev-threadpool-batch (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_threadpool_batch));
  fprintf (output,
           "#+allegro (ff:def-foreign-type xev-threadpool-task (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_threadpool_task));
  fprintf (output,
           "#-allegro (cffi:defctype xev-threadpool-task (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_threadpool_task));
  fprintf (output,
           "#+allegro (ff:def-foreign-type xev-threadpool-config (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_threadpool_config));
  fprintf (output,
           "#-allegro (cffi:defctype xev-threadpool-config (:array "
           ":unsigned-char %zu))\n",
           sizeof (xev_threadpool_config));
  fputs ("\n", output);

  fputs (";;; Callback types.\n", output);
  fprintf (output, "#+allegro (ff:def-foreign-type xev-cb-action :int)\n");
  fprintf (output, "#-allegro (cffi:defctype xev-cb-action :int)\n");
  fprintf (output, "(defconstant +XEV-DISARM+ %i)\n", XEV_DISARM);
  fprintf (output, "(defconstant +XEV-REARM+ %i)\n", XEV_DISARM);
  fputs ("\n", output);

  fprintf (output, "#+allegro (ff:def-foreign-type xev-run-mode-t :int)\n");
  fprintf (output, "#-allegro (cffi:defctype xev-run-mode-t :int)\n");
  fprintf (output, "(defconstant +XEV-RUN-NO-WAIT+ %i)\n", XEV_RUN_NO_WAIT);
  fprintf (output, "(defconstant +XEV-RUN-ONCE+ %i)\n", XEV_RUN_ONCE);
  fprintf (output, "(defconstant +XEV-RUN-UNTIL-DONE+ %i)\n",
           XEV_RUN_UNTIL_DONE);
  fputs ("\n", output);

  fprintf (output,
           "#+allegro (ff:def-foreign-type xev-completion-state-t :int)\n");
  fprintf (output, "#-allegro (cffi:defctype xev-completion-state-t :int)\n");
  fprintf (output, "(defconstant +XEV-COMPLETION-DEAD+ %i)\n",
           XEV_COMPLETION_DEAD);
  fprintf (output, "(defconstant +XEV-COMPLETION-ACTIVE+ %i)\n",
           XEV_COMPLETION_ACTIVE);
  fputs ("\n", output);
}
