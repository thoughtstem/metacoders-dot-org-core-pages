#lang racket/base

(require  website/bootstrap 
          metacoders-dot-org-lib
          "index.rkt"
          "coaches.rkt"
          "donate.rkt"
          "partners.rkt"
          "learn-more.rkt"
          )

(provide (all-from-out "index.rkt"
                       "coaches.rkt"
                       "donate.rkt"
                       "partners.rkt"
                       "learn-more.rkt"
                       ))

(module+ main
  (render #:to "out"
    (list
      (bootstrap-files)
      (imgs)
      (css)
      (index)
      (coaches)
      (partners)
      (learn-more)
      (donate))))
