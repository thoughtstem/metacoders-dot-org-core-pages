#lang at-exp racket

(provide partners)
(require metacoders-dot-org-lib
         website-js/components/l-system)

(define (jumbotron-header-section)
  (mc-jumbotron-header
      #:title "Become Our Partner"
      #:tagline "Make a difference by bringing MetaCoders to your community!"
      #:percent-height "60vh"
      #:image-path partners-img-path))

(define (what-we-do-section)
  (jumbotron  class: "mb-0"
              style: (properties background: "white")
    (container
      (h2 class: "text-center" "Help Us Teach Coding to Kids at Your Location")
      (br)
      (p "We are on a mission to teach as many students how to code as possible. If you have a space and you'd like to help us in our mission, we hope you'll reach out today!")
      (p "MetaCoders teaches weekly coding classes during the school year after-school, on weekday afternoons, and on weekends.  We run single day camps during school breaks like Winter Break and Spring Break.  During the summers, we run week-long, half-day and full-day camps. We could offer any or all of these kinds of programs at your location.")
      )
  )
)

(define (email-section)
  (l-system   #:x "240"
              #:y "p.height/3*2"
              #:start-angle -150
              #:step 18
              #:angle 90
              #:axiom "FX"
              #:loops 16
              #:rules (list (cons "X" "X+YF+")
                            (cons "Y" "-FX-Y"))
              #:bg-color "#e9ecef"
              #:line-color (~a primary 66);"rgba(255,193,7,0.4)"
              #:max-radius 0
            class: "card px-3 py-5 bg-transparent text-center mb-0"
            style: (properties 'overflow: "hidden")
  ;(jumbotron class: "mb-0"
             (container
              (h2 style: (properties text-align: "center") 
                  "Reach Out to Get Started")
              (br)
              (p "If you administer a location at which you would like us to consider teaching coding classes or camps, please reach out to us below! You can start by letting us know a little bit about your location and what days of the week and times your location would be available:")
              (div  class: "col-9 mx-auto"
                (email-signup #:interest "Becoming a Partner")))))

(define (partners)
  (page partners-top-path
        (normal-content-wide
         (include-p5-js)
          (jumbotron-header-section)
          (what-we-do-section)
          (email-section))))
        
