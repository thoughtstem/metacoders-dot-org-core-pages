#lang at-exp racket

(provide pods)

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

(define (pods)
  (page pods-top-path
        (normal-content-wide
          #:head (list (title "Coding Pods from MetaCoders")
                       (meta name: "description" content: "Learn Coding from Live Instructors starting on August 24th")
                       (common-critical-css)
                       (link 'rel: "preconnect" href:"https://q.stripe.com")
                       (link 'rel: "preconnect" href:"https://m.stripe.com")
                       (normal:script src:"https://js.stripe.com/v3")
                       )
          #:defer-css #t
          (include-p5-js)
          (jumbotron-header-section)
          (updated-list-value-prop)
          (customer-testimonial-section)
          (topics-section)
          )))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "Coding Pods"
    #:tagline "Create your own pods and meet with a Coding Coach." 
    #:percent-height "60vh"
    #:image-path online-banner-path
    #:alt-tag "Young boy coding a video game on his laptop."))


(define (updated-list-value-prop)
  (define (padded-li . content)
    (li style: (properties 'padding-top: 10) content))
  (jumbotron class: "mb-0"
             style: (properties background: "white")
             (container
               (h2 "Why Join MetaCoders Virtual Coding Club?")
               (ul 
                 (padded-li (h5 "Live-Taught on Your Schedule!") " MetaCoders knows that you and your family have a lot going on -- now more than ever! Online sessions with our Coding Coaches are offered " (b "every weekday, 1pm to 4pm PT") ". Join us on the hour daily, weekly, or whenever! Our schedule adapts to " (i "you") ".")
                 (padded-li (h5 "Ultimate Flexibility!") " With no session enrollments required, you and your students can decide to join us five minutes in advance, if you want! The absolute low-commitment class with no stress about changing schedules or missing sessions.") 
                 (padded-li (h5 "Customized Student Experience!") "  A range of topics offered daily allows students to design their own education experience around their interest and experience level. MetaCoders' unique Badge System allows students to move though curriculum at the pace that is right for them, track their progress, and pick up right where they left off each day.")
                 (padded-li (h5 "Real People, Real Time!") " Learning at home doesn't have to mean learning alone. Join other coding students from around the world and our experienced Coding Coaches for a social, fun, and educational experience!"))))
)

(define (topics-section)
  (jumbotron class: "mb-0"
             (container
               (h2 class: "text-center" "What Do Credits " (gems "") " Unlock?" )
               (br)
               (apply (curry responsive-row #:columns 3) (map display-topic (topics)))
               )
             ))

(define (display-topic t)
  t)