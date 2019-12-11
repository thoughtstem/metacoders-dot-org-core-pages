#lang at-exp racket 

(provide scientists)

(require metacoders-dot-org-lib
         "./training.rkt")

(define (scientists)
  (list
    (scientists-top)
    (training)))

(define (volunteer-description)
  (volunteer-page
    #:position-title "Learning Scientist"
    #:image-path volunteer-scientist-banner-path
    #:jumbotron-tagline "Study and monitor MetaCoders classes in your local area to make sure kids have the best classroom experiences."
    #:percent-height "60vh"
    #:locations-hiring (list "Dallas, Texas" "Minneapolis, Minnesota" "Temecula, CA" "Poway, CA" "Chula Vista, CA" "Reno, Nevada")
    #:volunteer-description 
    (div 
      (h6 "Job Description")
      (p "We're looking for volunteers to provide classroom support for our Coding Coaches and students. Learning Scientists will monitor classes, step in as necessary to provide educational interventions, and help Coaches make high-level strategic decisions to ensure all students achieve the best possible learning outcomes.")
      (p "If you are interested in volunteering in classrooms, MetaCoders will provide you all the training and materials you need to make a difference as a Learning Scientist. Send us an email below to join our team!")
    (h6 "Schedule")
    (ul
      (li "School Year: at least 2 hours per week.")
      (li "Summer: flexible schedule")
      ))
    #:application-link "https://docs.google.com/forms/d/e/1FAIpQLSf-MUudmDv-bAHZ0ey3LqjUE-sqlZiX6IbKwDyKW82pggWcLw/viewform"))

(define (bottom-section)
  (container
    (card-deck
      (email-signup #:title "Have Questions? Email us!")
      (begin-training
        #:training-exists? #f
        (p "Whether you're interested in becoming a Volunteer Scientist, or if you just want to learn more, you can start your training to become a Volunteer Scientist now!") 
        (training)))
    (br)))

(define (scientists-top)
  (page scientists-top-path
        (normal-content-wide
          (volunteer-description)
          (bottom-section))))
