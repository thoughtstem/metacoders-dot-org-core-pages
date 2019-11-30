#lang racket/base

(require  website/bootstrap 
          metacoders-dot-org-lib
          "index.rkt")

(provide (all-from-out "index.rkt"))

(module+ main
  (render #:to "out"
    (list
      (bootstrap-files)
      (imgs)
      (css)
      (index))))
