#!/usr/bin/env racket
#lang cli

(require racket/format
         relation
         (only-in "util.rkt"
                  format-output)
         "loading/loadlib.rkt"
         "regression.rkt"
         (submod "local/benchmarks.rkt" main)
         (prefix-in n: "nonlocal/intrinsic.rkt"))

(flag (selected #:param [selected null] name)
  ("-s" "--select" "Select form to benchmark")
  (selected (cons name (selected))))

(constraint (multi selected))

(help
 (usage
  (~a "Run benchmarks for individual Qi forms "
      "(by default, all of them), reporting the results "
      "in a configurable output format.")))

(flag (output-format #:param [output-format ""] fmt)
  ("-f"
   "--format"
   "Output format to use, either 'json' or 'csv'. If none is specified, no output is generated.")
  (output-format fmt))

(flag (type #:param [report-type "all"] typ)
  ("-t"
   "--type"
   "Type of report, either `local`, `nonlocal`, `loading` or `all` (default `all`)")
  (report-type typ))

(flag (regression-file #:param [regression-file #f] reg-file)
  ("-r" "--regression" "'Before' data to compute regression against")
  (regression-file reg-file))

;; Note: much of this file is duplicated across local/report.rkt
;; and loading/report.rkt. It could be avoided if we had
;; "composition of commands", see:
;; https://github.com/countvajhula/cli/issues/3
(program (main)
  (displayln "\nRunning local (forms) benchmarks and measuring module load time..."
             (current-error-port))

  (let* ([local-data (if (member? (report-type) (list "all" "local"))
                         (benchmark (selected))
                         null)]
         [nonlocal-data (if (member? (report-type) (list "all" "nonlocal"))
                            (n:benchmark "qi" (selected))
                            null)]
         [require-data (if (member? (report-type) (list "all" "loading"))
                           (list (require-latency "qi"))
                           null)]
         [output (~ local-data nonlocal-data require-data)])
    (if (regression-file)
        (let ([before (parse-benchmarks (parse-json-file (regression-file)))]
              [after (parse-benchmarks output)])
          (format-output (compute-regression before after)
                         (output-format)))
        (format-output output (output-format)))))

;; To run benchmarks for a form interactively, use e.g.:
;; (run main #("-s" "fanout"))

(run main)
