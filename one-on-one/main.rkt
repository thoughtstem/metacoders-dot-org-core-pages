#lang at-exp racket
(provide one-on-one)
(require (except-in metacoders-dot-org-lib script)
         (prefix-in normal: metacoders-dot-org-lib)
         website-js/components/l-system
         website-js
         "../topics.rkt"
         "../customer-testimonials.rkt"
         )

(define KEY (make-parameter "pk_live_Kd7tDKVnPMvyCyk5oAuSkbju00pa0xJPPL")
  ;(make-parameter "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA")
  )

(define (gems n) (span n " " (i class:"fas fa-gem")))

(define (one-on-one)
  (page one-on-one-top-path
        (normal-content-wide
          #:head (list (title "One on One Coding Sessions")
                       (meta name: "description" content: "Learn Coding with Live Instructors.")
                       (common-critical-css)
                       (link 'rel: "preconnect" href:"https://q.stripe.com")
                       (link 'rel: "preconnect" href:"https://m.stripe.com")
                       (normal:script src:"https://js.stripe.com/v3")
                       )
          #:defer-css #t
          (include-p5-js)
          (jumbotron-header-section)
          (one-on-one-summary)
          )))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "One on One Coding Sessions"
    #:tagline "Learn Coding with Live Instructors." 
    #:percent-height "60vh"
    #:image-path online-banner-path
    #:alt-tag "Young boy coding a video game on his laptop."))


(define (one-on-one-summary)
  (define (padded-li . content)
    (li style: (properties 'padding-top: 10) content))
  (jumbotron class: "mb-0"
             style: (properties background: "white")
             (container
               (h2 "Coming Soon!"))))

