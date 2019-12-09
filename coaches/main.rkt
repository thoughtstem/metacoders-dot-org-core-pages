#lang at-exp racket

(provide coaches)

(require metacoders-dot-org-lib)

(define (coaches)
  (list (coaches-top)))

(define (employment-section)
  (employment-page #:position-title "Coding Coach"
                   #:image-path coding-coach-banner-path
                   #:jumbotron-tagline "Work at home and prepare supplies for local classes!"
                   #:percent-height "60%"
                   #:locations-hiring (list "Dallas, Texas")
                   #:job-description 
  (div
    (h6 "Description")
    (p "We are currently seeking energetic, passionate individuals who will be \"Coding Coaches\" for computer science classes & camps in your area. Candidates do not necessarily need to be experienced in computer science, but should be excited to learn coding with us! Coding Coaches guide students as they learn computer science using MetaCoders’ innovative curriculum. Applicants are strongly encouraged to check out the online training below to see if this position is a good fit for them.")
    (h6 "Schedule")
    (ul
      (li "School Year: approximately 2-5 hours per week to start.")
      (li "Summer: 40 hours/week for 5 weeks.")))
                    #:job-link "https://www.indeedjobs.com/thoughtstem-llc/_hl/en"))


(define (start-now-section)
  (container
    (hr)
    (h3 "Not Hiring in Your City?")
    (p class: "mt-3"
       "All of MetaCoders training and curriculum are open source, meaning you can access them and start teaching in your community for free today! We also love to hear from people who want us to come to their community, so reach out to us using the form below and help us bring innovative, science-based coding education to your city!")
    (card-deck
        (email-signup #:title "Have Questions? Email us!")
        (begin-training
          (p "Whether you're interested in being hired as a Coding Coach, or you're interested in starting free classes in your area, you can start your training to become a coach now!") 
          (list "coaches" "training.html")))
    (br)))


(define (coaches-top)
  (page coaches-top-path
        (normal-content-wide
          (employment-section)
          (start-now-section))))
