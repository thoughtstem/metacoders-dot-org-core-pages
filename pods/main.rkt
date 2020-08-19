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
          #:head (list (title "MetaCoders for Micro-Schools")
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
          (pod-signup)
          (customer-testimonial-section)
          (topics-section)
          )))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "MetaCoders for Micro-Schools"
    #:tagline "Bring professional coding education into your homeschooling experience." 
    #:percent-height "60vh"
    #:image-path students-in-row-path
    #:alt-tag "Kids coding together in a small group."))


(define (updated-list-value-prop)
  (jumbotron class: "mb-0 text-center bg-white"
             (container
              (h2 "MetaCoders now offers custom classes for your pod or micro-school!")
              (responsive-row #:columns 4 #:d-flex? #t
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "h6 bg-warning text-white" "Build your Own Schedule!")
                                    (card-body
                                     "Our staff will work with you to find the best time for your group of students. Start every week with coding class at 9am on Monday or code three times a week at noon! We can create the unique educational experience that works for you."))
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "h6 bg-warning text-white" "High Quality, Affordable Prices!")
                                    (card-body
                                     "Our team works with your specific circumstances to bring you the most affordable price without sacrificing quality. More than just a flat rate per student, our pricing scale means lower prices for you and your fellow parents!")) 
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "h6 bg-warning text-white" "Structured for Your Students!")
                                    (card-body
                                     "Unlike our drop-in Coding Club, MetaCoders in your Micro-School is able to provide the same Coding Coach every time and guarantee the same students in every session -- " (i "your") " students! Get personalized attention and structure to maximize your students' growth."))
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "h6 bg-warning text-white" "Completely Customizable!")
                                    (card-body
                                     "Are your students specifically interested in a topic not currently offered in Coding Club? We can customize our topics to the needs of your students and even create new curriculum just for you!*" (br)(i class: "small" "*Additional cost for custom curriculum."))))

              )))

#;(define (pricing-section)
  (jumbotron class: "mb-0"
             (container
              (h2 "What does it Cost?")
              (p "Our pricing scale adapts "))))

(define (topics-section)
  (jumbotron class: "mb-0"
             (container
               (h2 class: "text-center" "What Can Your Students Learn?" )
               (br)
               (apply (curry responsive-row #:columns 3) (map display-topic (topics)))
               )
             ))

(define (display-topic t)
  t)

(define (pod-signup)
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
                (card-header class: "bg-primary text-white text-center"
                             (h5 "Contact us to Bring MetaCoders to your Micro-School!"))
                (card-body 
                 (form action:
                       "https://docs.google.com/forms/u/1/d/e/1FAIpQLSfc1cpZ0o5OT8c38WZ-XMOTsr5Zofrk7L9Q35EY7E2LJTNAtg/formResponse"
                       (div class:"form-group"
                            (label "Contact Parent Name")
                            (input type: "text" class: "form-control" name: "entry.1054010153"))
                       (div class:"form-group"
                            (label "Contact Parent Email")
                            (input type:"email" class: "form-control" name: "entry.470834101"))
                       (div class:"form-group"  
                            (label "How many students?")
                            (input type: "text" class: "form-control" name: "entry.56393326"))
                       (div class:"form-group"  
                            (label "What are their ages?")
                            (input type: "text" class: "form-control" name: "entry.1092274102"))
                       (div class:"form-group"  
                            (label "What topic(s) are you interested in bringing in?")
                            (input type: "text" class: "form-control" name: "entry.584219301"))
                       (div class:"form-group"  
                            (label "What days and times would be ideal for you? Please specify your timezone.")
                            (input type: "text" class: "form-control" name: "entry.360691127"))
        
                       (button-primary type: "submit" name: "submit"
                                       "Submit"))
                 (br)
                 (container class: "text-center"
                            (i "Thank you for your interest. You will hear back from our team soon with a pricing quote, scheduling options, and more details.")))))))
