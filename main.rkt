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
          "online.rkt"
          "coding-club.rkt"
          "tech-coords.rkt"
          "volunteer-online.rkt"
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
                       "online.rkt"
                       "coding-club.rkt"
                       "tech-coords.rkt"
                       "volunteer-online.rkt"
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
      (online)
      (coding-club)
      (tech-coords)
      (volunteer-online)
      (coders)
      (city-search)
      (cities)
      (checkout-fail)
      (checkout-success)
      (camp-checkout-success)
      (donate-success)
      (learn-more)
      )))
