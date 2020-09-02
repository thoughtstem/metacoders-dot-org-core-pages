#lang at-exp racket
(provide badges)
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

(define (badges)
  (page badges-top-path
        (normal-content-wide
          #:head (list (title "Badges")
                       (meta name: "description" content: "Check out your badge map!")
                       (common-critical-css)
                       (link 'rel: "preconnect" href:"https://q.stripe.com")
                       (link 'rel: "preconnect" href:"https://m.stripe.com")
                       (normal:script src:"https://js.stripe.com/v3")
                       )
          #:defer-css #t
          (include-p5-js)
          (jumbotron-header-section)
          (updated-list-value-prop)
          )))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "Badges"
    #:tagline "Check out your badge map!" 
    #:percent-height "60vh"
    #:image-path online-banner-path
    #:alt-tag "Young boy coding a video game on his laptop."))


(define (updated-list-value-prop)
  (define (padded-li . content)
    (li style: (properties 'padding-top: 10) content))
  (jumbotron class: "mb-0"
             style: (properties background: "white")
             (container
               (h2 "Follow this link to see your badge map!")
               (p "Open this " (a class: "text-warning" href: "https://forum.metacoders.org/t/badge-report-finder/686" "forum post") " and follow the instructions there."))))

