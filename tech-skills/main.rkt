#lang at-exp racket

(provide tech-skills)

(require (except-in metacoders-dot-org-lib script)
         (prefix-in normal: metacoders-dot-org-lib)
         website-js/components/l-system
         website-js
         )

(define KEY (make-parameter "pk_live_Kd7tDKVnPMvyCyk5oAuSkbju00pa0xJPPL")
  ;(make-parameter "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA")
  )

(define (gems n) (span n " " (i class:"fas fa-gem")))

(define (tech-skills)
  (page tech-skills-top-path
        (normal-content-wide
          #:head (list (title "Tech Skills Development")
                       (meta name: "description" content: "Learn basic computer skills while coding!")
                       (common-critical-css)
                       (link 'rel: "preconnect" href:"https://q.stripe.com")
                       (link 'rel: "preconnect" href:"https://m.stripe.com")
                       (normal:script src:"https://js.stripe.com/v3")
                       )
          #:defer-css #t
          (include-p5-js)
          (jumbotron-header-section)
          (updated-list-value-prop)
          (tech-skills-signup)
          )))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "Tech Skills Development"
    #:tagline "Learn Basic Computer Skills while Coding!" 
    #:percent-height "60vh"
    #:image-path students-in-row-path
    #:alt-tag "Kids coding together in a small group."))


(define (updated-list-value-prop)
  (jumbotron class: "mb-0 text-center bg-white"
             (container
              (h2 "Learn Basic Computer Skills while Coding!")
              (responsive-row #:columns 4 #:d-flex? #t
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "h6 bg-warning text-white" "Learn about")
                                    (card-body
                                     "browsers, tabs, window management, typing skills"))
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "h6 bg-warning text-white" "How will you learn?")
                                    (card-body
                                     "coach will guide you, give you assignments")) 
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "h6 bg-warning text-white" "Why is it important?")
                                    (card-body
                                     "talk to family, share memes"))
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "h6 bg-warning text-white" "Class Schedule")
                                    (card-body
                                     "Fridays from 10 - 11 am PT."))))

              ))

(define (tech-skills-signup)
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
              class: "card px-3 py-5 mb-0 bg-transparent"
              style: (properties 'overflow: "hidden")
              (container
               (card class: "border-primary"
                (card-header class: "h5 bg-primary text-white text-center"
                             "Submit the form below for more information!")
                (card-body
                 (form action: "https://docs.google.com/forms/u/1/d/e/1FAIpQLSe8Qas_4iDdxHLQp8JlVsKBJWyxDn6jBVjfHV5J5rew3RfIUA/formResponse"
                       ;https://docs.google.com/forms/d/e/1FAIpQLSe8Qas_4iDdxHLQp8JlVsKBJWyxDn6jBVjfHV5J5rew3RfIUA
                       ;entry.1054010153=sonny
                       ;entry.470834101=sonny@email.com
                       ;entry.584219301=python
                       (div class:"form-group"
                            (label "Name")
                            (input type: "text" class: "form-control" name: "entry.1054010153"))
                       (div class:"form-group"
                            (label "Email")
                            (input type:"email" class: "form-control" name: "entry.470834101"))
                       (div class:"form-group"  
                            (label "What do you want to tell us? e.g. A different time for our online session (please specify your timezone), a specific topic you're interested in learning.")
                            (input type: "text" class: "form-control" name: "entry.584219301"))
        
                       (button-primary type: "submit" name: "submit"
                                       "Submit"))
                 (br)
                 (container class: "text-center"
                            (i "Thank you for your interest. You will hear back from our team soon with more details.")))))))
