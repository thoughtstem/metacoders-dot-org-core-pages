#lang at-exp racket

(provide coders)
(require metacoders-dot-org-lib
         "./training.rkt")

(define (coders)
  (list
    (coders-top)
    (training)))

(define (volunteer-description)
  (volunteer-page
    #:position-title "Volunteer Coder"
    #:image-path volunteer-coder-banner-path
    #:jumbotron-tagline "Design and build educational software that inspires the next generation of computer scientists!"
    #:percent-height "60vh"
    #:locations-hiring (list "Anywhere!")
    #:volunteer-description 
    (div 
      (h6 "Job Description")
      (p "Create educational software that is useable by students around the world. Our programming languages are intended to make it fun for students of various skill levels to create video games, apps, and websites. Help us build the languages that inspire students to become life-long coders.")
      (p "If you are interested in volunteering to code with us, MetaCoders will provide you all the training and documentation you need to create fun educational software for K-12 students. Send us an email below to join our team!"))
    #:application-link "https://docs.google.com/forms/d/e/1FAIpQLSedrxVA5vQWHDi1hhttGXkkH3x7fSiL7pkjwLhJ5MNG-eUG7A/viewform"))

(define (bottom-section)          
  (container
    (card-deck
      (email-signup #:title "Have Questions? Email us!" #:interest "Becoming a Volunteer Coder")
      (begin-training
        #:training-exists? #f
        (p "Whether you're interested in becoming a Volunteer Coder, or if you just want to learn more, you can start your training to become a Volunteer Coder now!") 
        (training)))
    (br)))

(define (coders-top)
  (page coders-top-path
        (normal-content-wide #:head (title "Volunteer to Code Educational Technologies | MetaCoders")
          (volunteer-description)
          (bottom-section))))
