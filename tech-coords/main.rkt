#lang at-exp racket 

(provide tech-coords)

(require metacoders-dot-org-lib
         "./training.rkt")

(define (tech-coords)
  (list
    (tech-coords-top) 
    (training)))

(define (tech-coords-top)
  (page tech-coords-top-path
        (normal-content-wide
          (tech-coord-page)
          (start-now-section))))

(define (start-now-section)
  (container
    (card-deck
        (email-signup #:title "Have Questions? Email us!")
        (begin-training
          #:training-exists? #f
          (p "Whether you're interested in being hired as a Technology Coordinator, or you're interested in bringing classes to your area, you can start your training to become a Technology Coordinator now!") 
          (training)))
    (br)))

(define (tech-coord-page)
  (employment-page  #:position-title "Technology Coordinator"
                    #:image-path tech-coordinator-banner-path
                    #:jumbotron-tagline "Help us connect coaches and students!"
                    #:percent-height "60vh"
                    #:locations-hiring (list "Dallas, Texas" "Phoenix, Arizona" "Reno, Nevada" "Temecula, California")
                    #:job-description 
    (div
      (h6 "Description")
      @p{MetaCoders is currently seeking upbeat, motivated @u{individuals who want to make a positive difference} in their local community as Technology Coordinators. For this position, MetaCoders is specifically seeking individuals who are stay-at-home parents, stay-at-home caretakers, or who have the leisure to work part-time out of their home offices.}
      @p{Technology Coordinators play a critical role in MetaCoders mission to deliver coding education to local kids. Technology Coordinators prepare computers, hardware, and other classroom materials for coding classes in their surrounding areas. A Technology Coordinator's home @u{serves as a hub for Coding Coaches} (our instructors) to pick up equipment before class and return it after.} 
      @p{Most importantly, Technology Coordinators help further the MetaCoders mission by approaching and setting up new locations for coding classes, thereby @u{helping make computer science education more accessible} in their area.}
      (p "Applicants are strongly encouraged to check out the online training below to see if this position is a good fit for them.")
      (h6 "Schedule")
      (ul
        (li "School Year: approximately 1.5-4 hours per week to start.")
        (li "Summer: approximately 4 hours/week for 5 weeks.")))
                  #:job-link "https://www.indeedjobs.com/thoughtstem-llc/_hl/en"))
