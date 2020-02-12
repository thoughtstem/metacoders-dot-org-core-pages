#lang at-exp racket

(provide summer-interns)
(require metacoders-dot-org-lib
         "./training.rkt")

(define (summer-interns)
  (list
    (summer-camp-interns-top)
    (training)))

(define (intern-description)
  (intern-page
    #:position-title "Summer Camp Team Leader"
    #:image-path summer-camp-intern-banner-path
    #:alt-tag "Summer camp intern in computer science education bonds with a young boy at camp"
    #:jumbotron-tagline "Lead students in our summer camps in coding exercises and make sure they have a great first experience with coding!"
    #:percent-height "60vh"
    #:locations-hiring (list "Dallas, TX" "Minneapolis, MN" "Temecula, CA" "Reno, NV" "Phoenix, AR" "New Orleans, LA" "Charlotte, NC")
    #:intern-description 
    (div 
      (h6 "Job Description")
      (p "MetaCoders' internship program is designed for incoming high school seniors through college students interested in pursuing careers in education. This is an unpaid internship with a focus on developing skills as an educator and leader.")
      (p "")
      (a href: "https://docs.google.com/forms/d/e/1FAIpQLSfx3BAy-y1We-pvXtXEU096Tys_7xPrphyedmS4RcWI00RzJw/viewform" (button-primary class: "mb-4"
                      id: "main-button" 
                      "Apply Here")))))

(define (bottom-section)
  (container
    (card-deck
      (email-signup #:title "Have Questions? Email us!" #:interest "Becoming a Summer Camp Team Leader")
      (begin-training
        #:training-exists? #f
        (p "Whether you're interested in becoming a Summer Camp Team Leader Intern, or if you just want to learn more, you can start your training to become a Summer Camp Team Leader now!") 
        (training)))
    (br)))

(define (summer-camp-interns-top)
  (page summer-camp-intern-top-path
        (normal-content-wide
         #:head (list
                 (title "Summer Camp Team Leader Internship | Teach Kids Code | MetaCoders")
                 (meta name: "description" content: "Summer Camp Team Leaders are high school or college students with a passion for computer science education who want to give back to their communities!")
                 (common-critical-css)
                 )
         #:defer-css #t
         (intern-description)
         (bottom-section))))
