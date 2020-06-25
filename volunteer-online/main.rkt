#lang at-exp racket

(provide volunteer-online)
(require metacoders-dot-org-lib
         "./training.rkt")

(define (volunteer-online)
  (list
    (summer-camp-interns-top)
    (training)))

(define (volunteer-description)
  (volunteer-page
    #:position-title "Volunteer in Our Online Coding Classrooms"
    #:image-path summer-camp-intern-banner-path
    #:alt-tag "Coding Coach volunteer in computer science education bonds with a young boy at camp"
    #:jumbotron-tagline "Inspire the next generation of software developers, while learning classroom leadership skills and improving your own coding skills."
    #:percent-height "60vh"
    #:locations-hiring (list "Anywhere! This is an online opportunity!")
    #:volunteer-description 
    (div 
      (h6 "Job Description")
      (p "MetaCoders offers several opportunities for volunteers to teach and learn with us! As a volunteer you can help bring computer science education to students around the world in our online classes while building your own skills in coding, teaching, curriculum design, and administration. Volunteer hours are very flexible and easily scheduled; join us for one hour a week or up to twenty hours a week! MetaCoders volunteers also earn Quarantine Credits for the students in their life. For every 1 hour you volunteer, you earn 1 free hour for your student. Bring high-quality education to your child, cousin, niece, nephew, or neighbor!")
      (p "If you have any questions, please email our Volunteer Coordinator at " (a href: "mailto:volunteer@metacoders.org" target: "_blank" "volunteer@metacoders.org")  ". Join our community by filling out the application below!")
      )
    #:application-link "https://forms.gle/Vw1ZCRiLzRxdGwoZA"
    ))

(define (summer-camp-interns-top)
  (page summer-camp-intern-top-path
        (normal-content-wide
         #:head (list
                 (title "Summer Camp Team Leader Internship | Teach Kids Code | MetaCoders")
                 (meta name: "description" content: "Summer Camp Team Leaders are high school or college students with a passion for computer science education who want to give back to their communities!")
                 (common-critical-css)
                 )
         #:defer-css #t
         (volunteer-description)
         (br))))
