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
          (pod-signup)
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
  (jumbotron class: "mb-0 text-center"
             style: (properties background: "white")
             (container
              (h2 "Why create a Pod and Join MetaCoders Virtual Coding Club?")
              (responsive-row #:columns 4 #:d-flex? #t
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "bg-warning text-white" "Flexible Schedule!")
                                    (card-body
                                     "Online Pod sessions with our Coding Coaches can be scheduled to fit " (b "your schedule") ". Join us on the hour daily, weekly, or whenever! We will find a time that works best for " (i "your pod") "."))
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "bg-warning text-white" "Adjustable Prices!")
                                    (card-body
                                     "We have a different pricing for each 1-hour session depending on the size of " (i "your pod") ". Pods with " (b "2 - 6") " students cost " (b "$70") ". Pods with " (b " 6 - 10") " students cost " (b " $160") ". If you are part of a larger pod email us at contact@metacoders.org for a quote.")) 
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "bg-warning text-white" "Guaranteed Instructor!")
                                    (card-body
                                     "In our Coding Club, instructors rotate topics every day. When you create a pod we will pair you with one of our " (b "Pro-Instructors") " and we guarantee that they will work every scheduled session with " (i "your pod") "."))
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "bg-warning text-white" "Guaranteed Schedule!")
                                    (card-body
                                     "Some of our topics are only available at specific times a day and others are only offered certain days a week. When you create a pod whatever topic(s) you choose are guaranteed to be available during your session.")))

              )))

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

(define (pod-signup)
  (container
   (card class: "jumbotron"
         (card-body
          (card-title class: "pb-4"
                      style: "font-size: 30px; text-align: center" "To get more details about your specific pod, fill out this form!") 
          (form action:
                "https://docs.google.com/forms/u/1/d/e/1FAIpQLSfc1cpZ0o5OT8c38WZ-XMOTsr5Zofrk7L9Q35EY7E2LJTNAtg/formResponse"
                (div class:"form-group"
                     (label "Contact Parent Name")
                     (input type: "text" class: "form-control" name: "entry.1054010153"))
                (div class:"form-group"
                     (label "Contact Parent Email")
                     (input type:"email" class: "form-control" name: "entry.470834101"))
                (div class:"form-group"  
                     (label "How many students are in your pod?")
                     (input type: "text" class: "form-control" name: "entry.56393326"))
                (div class:"form-group"  
                     (label "What are their ages?")
                     (input type: "text" class: "form-control" name: "entry.1092274102"))
                (div class:"form-group"  
                     (label "What topic(s) are they interested in?")
                     (input type: "text" class: "form-control" name: "entry.584219301"))
                (div class:"form-group"  
                     (label "What days and times is your pod available? Please specify your timezone.")
                     (input type: "text" class: "form-control" name: "entry.360691127"))
        
                (button-primary type: "submit" name: "submit"
                                "Submit"))))))