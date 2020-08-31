#lang at-exp racket

(provide genentech)

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

(define (genentech)
  (page genentech-top-path
        (normal-content-wide
          #:head (list (title "Genentech Coding Scholarship")
                       (meta name: "description" content: "Available for Students from the Vista and ____ School District")
                       (common-critical-css)
                       (link 'rel: "preconnect" href:"https://q.stripe.com")
                       (link 'rel: "preconnect" href:"https://m.stripe.com")
                       (normal:script src:"https://js.stripe.com/v3")
                       )
          #:defer-css #t
          (include-p5-js)
          (jumbotron-header-section)
          (updated-list-value-prop)
          (scholarship-application)
          (customer-testimonial-section)
          (topics-section)
          )))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "Genentech Coding Scholarship"
    #:tagline "Professional coding education for your home learning experience." 
    #:percent-height "60vh"
    #:image-path students-in-row-path
    #:alt-tag "Kids coding together in a small group."))


(define (updated-list-value-prop)
  (jumbotron class: "mb-0 text-center bg-white"
             (container
              (h2 "Apply to get a Scholarship to MetaCoders Coding Classes!")
              (p "Scholarship requirements here...")
              )))


(define (topics-section)
  (jumbotron class: "mb-0"
             (container
               (h2 class: "text-center" "What Can Your Students Learn?" )
               (br)
               (h5 class: "text-center" "The following topics can run on Chromebooks, macOS, or Windows and require no installation.")
               (apply (curry responsive-row #:columns 3) (map display-topic (noinstall-topics)))
               (hr)
               (h5 class: "text-center" "The following topics require software to be installed on macOS or Windows.")
               (apply (curry responsive-row #:columns 3) (map display-topic (install-topics)))
               )
             ))

(define (display-topic t)
  t)

(define (scholarship-application)
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
                             "Submit the form below to apply for the scholarship!")
                (card-body
                 (form action: "https://docs.google.com/forms/u/1/d/e/1FAIpQLSd5uZWn8a3X5e8bR12ppdGj7cFmiPOPq8fZ54RFK_9oBNzfKw/formResponse"
                       ;entry.1054010153=sonny+jr
                       ;entry.2077215683=sonny+sr
                       ;entry.470834101=sonny@email.com
                       ;entry.56393326=2010-01-01
                       ;entry.1900729753=Vista+Elementary
                        (div class:"form-group"
                            (label "Student's Name")
                            (input type: "text" class: "form-control" name: "entry.1054010153"))
                       (div class:"form-group"
                            (label "Contact Parent Name")
                            (input type: "text" class: "form-control" name: "entry.2077215683"))
                       (div class:"form-group"
                            (label "Contact Parent Email")
                            (input type:"email" class: "form-control" name: "entry.470834101"))
                       (div class:"form-group"  
                            (label "Student's Date of Birth")
                            (input type: "date" class: "form-control" name: "entry.56393326"))
                       (div class:"form-group"  
                            (label "Student's School Name")
                            (input type: "text" class: "form-control" name: "entry.1900729753"))
        
                       (button-primary type: "submit" name: "submit"
                                       "Submit"))
                 (br)
                 (container class: "text-center"
                            (i "Thank you for your interest. You will hear back from our team soon.")))))))
