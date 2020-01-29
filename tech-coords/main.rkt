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
         #:head (list
                 (title "Tech Coordinators | Apply to Support CS Education | MetaCoders")
                 (meta name: "description" content: "Tech Coordinators are part-time staff who maintain hardware for Coding Coaches near class locations in their area. They advocate for CS education in their area.")
                 (common-critical-css)
                 )
         #:defer-css #t
         (tech-coord-page)
         (start-now-section))))

(define (start-now-section)
  (container
    (card-deck
        (email-signup #:title "Have Questions? Email us!" #:interest "Becoming a Tech Coordinator")
        (begin-training
          #:training-exists? #f
          (p "Whether you're interested in being hired as a Technology Coordinator, or you're interested in bringing classes to your area, you can start your training to become a Technology Coordinator now!") 
          (training)))
    (br)))

(define (tech-coord-page)
  (employment-page  #:position-title "Technology Coordinator"
                    #:image-path tech-coordinator-banner-path
                    #:alt-tag "Technology coordinator installs software on chromebooks in her comfortable home"
                    #:jumbotron-tagline "Help us connect coaches and students!"
                    #:percent-height "60vh"
                    #:locations-hiring (list "Dallas, Texas" "Phoenix, Arizona" "Reno, Nevada" "Temecula, California" "Minneapolis, MN" "New Orleans, LA")
                    #:short-job-description 
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
                  #:job-link "https://forms.gle/KXJRL6VyjYFqi2nN7"
                  #:long-job-description
  (div
    (h3 "About MetaCoders")
    (p "MetaCoders is a non-profit with a mission to promote grass-roots, community-based coding education for students across the country. MetaCoders was launched by the founders of ThoughtSTEM who have been running after-school computer science programs and camps in San Diego for the past 7 years. MetaCoders helps cultivate an ecosystem of teachers and students with the goal making our communities more technology-literate.")
    (h3 "Part-Time Technology Coordinator Position")
    (p "MetaCoders is currently seeking upbeat, motivated individuals who want to make a positive difference in their local community as Technology Coordinators. For this position, MetaCoders is specifically seeking individuals who are stay-at-home parents, stay-at-home caretakers, or who have the leisure to work part-time out of their home offices. We are also looking for people who have lived in their community for a while and are familiar with where families live, where people meet and where there are facility rentals available.")
    (p "Technology Coordinators play a critical role in MetaCoders mission to deliver coding education to local kids. Technology Coordinators prepare computers, hardware, and other classroom materials for coding classes in their surrounding areas. A Technology Coordinator's home serves as a \"hub\" for Coding Coaches (our instructors) to pick-up and drop-off equipment before and after class, respectively. With the help of MetaCoders' staff, Technology Coordinators fix any hardware that is broken and charge equipment between classes. Most importantly, Technology Coordinators help further the MetaCoders mission by approaching and setting up new locations for coding classes, thereby helping make computer science education more accessible in their area.")
    (p "Early on, Technology Coordinators' hours will be limited to 1-3 a week, but hours will scale as new classes are opened in your area.")
    (p "The expectations and responsibilities of a MetaCoders Technology Coordinator are:")
    (ul
      (li "Being our Ambassador in your city")
      (li "Setting up new coding class locations with the help of MetaCoders")
      (li "Training on MetaCoders technologies, equipment, languages, and curriculum")
      (li "Setting up equipment for the first time")
      (li "Keeping equipment up to date; fixing equipment as necessary")
      (li "Charging equipment")
      (li "Packing equipment for Coding Coach pick-ups")
      (li "Unpacking & inventorying equipment after Coding Coach drop-off")
      (li "Regular weekly online meetings with MetaCoders staff"))
    (p "Additionally, a MetaCoders Technology Coordinator may:")
    (ul
      (li "Be asked to be a substitute Coding Coach in the event that Coding Coach has an emergency such as an illness.")
      (li "Read and respond in a timely manner to emails from MetaCoders staff.")
      (li "Be ready for all Coding Coach pick-ups & drop-offs before and after class, barring emergencies or significant illness. In cases of emergency or significant illness, Technology Coordinators must alert MetaCoders with as much advance notice as possible so that other plans can be made for equipment.")
      (li "Be asked to promote MetaCoders classes and camps at a local event.")
      (li "Perform other duties for MetaCoders as necessary."))
    (h3 "Compensation and Benefits:")
    (ul
      (li "Wages start at $15/hr.")
      (li "Other incentives available.")
      (li "Hours will be limited at first but will scale as new locations and classes are setup in your area.")
      (li "Paid to build valuable coding and technology skills through online trainings.")
      (li "Work with awesome people."))
    (h3 "Position Requirements:")
    (ul
      (li "Must live within the zipcode area we plan to teach classes, or within a mile or two. (Email us at contact@metacoders.org for zipcode information for your area.)")
      (li "Must be at least 18 years old.")
      (li "Must live at a residential property with easy parking access (preferably a driveway).")
      (li "Must have availability for both:")
      (ul
        (li "Summer: 8:30am-4:30pm")
        (li "School year: Some availability on weekends or weekday afternoons.")
)
      (li "Comfortable with computers and technology.")
      (li "Must be able to lift approximately 50 pounds.")
      (li "Must have access to internet at home.")
      (li "Able to pass a background check (expenses reimbursed).")
      (li "Able to obtain a negative TB test (expenses reimbursed). Note: this may not be required at all locations."))
    (h3 "Please Include in Your Application:")
    (ul
      (li "Your current availability, especially on Saturdays and your expected summer availability."))
    (p "Apply today and join our team!"))
))
