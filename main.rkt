#lang racket/base

(require  website/bootstrap 
          metacoders-dot-org-lib
          "index.rkt"
          "coaches.rkt"
          "donate.rkt"
          "partners.rkt"
          "scientists.rkt"
          "terms-and-conditions.rkt"
          "join-our-team.rkt"
          "tech-coords.rkt"
          "summer-interns.rkt"
          "coders.rkt"
          "city-search.rkt"
          "checkout-fail.rkt"
          "checkout-success.rkt"
          "learn-more.rkt"
          )

(provide (all-from-out "index.rkt"
                       "coaches.rkt"
                       "donate.rkt"
                       "partners.rkt"
                       "scientists.rkt"
                       "terms-and-conditions.rkt"
                       "join-our-team.rkt"
                       "tech-coords.rkt"
                       "summer-interns.rkt"
                       "coders.rkt"
                       "city-search.rkt"
                       "checkout-fail.rkt"
                       "checkout-success.rkt"
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
      (donate)
      (partners)
      (scientists)
      (terms-and-conditions)
      (join-our-team)
      (tech-coords)
      (summer-interns)
      (coders)
      (city-search)
      (cities)
      (checkout-fail)
      (checkout-success)
      (learn-more)
      )))
