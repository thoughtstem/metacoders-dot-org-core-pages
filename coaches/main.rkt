#lang at-exp racket

(provide coaches)

(require metacoders-dot-org-lib)

(define (coaches)
  (list (coaches-top)))

(define (employment-section)
  (employment-page #:position-title "Coding Coach"
                   #:image-path coding-coach-banner-path
                   #:alt-tag "Coding instructor teaching elementary school students how to code at UC San Diego summer camp"
                   #:jumbotron-tagline "Work at home and prepare supplies for local classes!"
                   #:percent-height "60vh"
                   #:locations-hiring (list "Dallas, Texas" "New Orleans, LA" "Charlotte, NC" "Minneapolis, MN")
                   #:short-job-description 
  (div
    (h6 "Description")
    (p "We are currently seeking energetic, passionate individuals who will be \"Coding Coaches\" for computer science classes & camps in your area. Candidates do not necessarily need to be experienced in computer science, but should be excited to learn coding with us! Coding Coaches guide students as they learn computer science using MetaCoders’ innovative curriculum. Applicants are strongly encouraged to check out the online training below to see if this position is a good fit for them.")
    (h6 "Schedule")
    (ul
      (li "School Year: approximately 2-5 hours per week to start.")
      (li "Summer: 40 hours/week for 5 weeks.")))
                    #:job-link "https://forms.gle/KXJRL6VyjYFqi2nN7"
                    #:long-job-description
  (div
    (h3 "About MetaCoders")
    (p "MetaCoders is a non-profit with a mission to promote grass-roots, community-based coding education for students across the country. MetaCoders was launched by the founders of ThoughtSTEM who have been running after-school computer science programs and camps in San Diego for the past 7 years. MetaCoders believes that teaching students how to code will transform our education system for the better.")
    (h3 "Part-Time Instructor Position")
    (p "We are currently seeking energetic, passionate individuals who will be \"Coding Coaches\" for computer science classes & camps in your area. We are looking for someone who describes themselves as a lifelong learner, who is eager to learn something new.")
    (p "Coding Coaches guide students as they learn computer science using MetaCoders’ innovative curriculum. During the school year, Coding Coaches predominantly work with students in Kindergarten through 6th grade in weekly 1-2 hour classes. Over the summer, Coding Coaches predominantly work with students in Kindergarten through 10th grade in summer camps, which operate from 9am-4pm.")
    (p "The expectations and responsibilities of a MetaCoders Coding Coach in the classroom are:")
    (ul
      (li "Guide students through the curriculum; engaging students with different experience levels and motivating everyone with your can-do attitude!")
      (li "Create a safe and fun learning environment using classroom management skills and correcting student behavior when needed. We can help you learn the techniques for accomplishing this.")
      (li "Teach independently with 5-10 students or co-teach with other instructors in larger classes. Monitor all students and keep them safe from arrival to dismissal.")
      (li "Arrive dressed appropriately at the scheduled arrival time to set up before class begins. Finish tidying after class ends.")
      (li "Communicate with MetaCoders staff before, during, and after class on attendance, behavior and student progress."))
    (p "Additionally, a MetaCoders Coding Coach is expected to:")
    (ul
      (li "Train on MetaCoders technology, languages, and curriculum to effectively coach students and answer questions.")
      (li "Read and respond in a timely manner to emails from MetaCoders staff regarding scheduling, curriculum, and other updates.")
      (li "Attend all classes, training sessions, and other programs committed to, barring emergencies or significant illness. In cases of emergency or significant illness, coaches must alert MetaCoders with as much advance notice as possible.")
      (li "Teach two or more classes each season.")
      (li "Perform other duties for MetaCoders as necessary."))
    (h3 "Compensation and Benefits:")
    (ul
      (li "Wages start at $15/hr.")
      (li "Bonuses are awarded to Coding Coaches who opt to teach classes larger than 5 students.")
      (li "Hours will be limited at first during the school year. During the summer, hours will be M-F, 8:30am-4:30pm.")
      (li "Paid to build valuable coding and technology skills through online trainings.")
      (li "Learn communication techniques through paid classroom management training.")
      (li "Work with awesome people and spread computer science education in YOUR community."))
    (h3 "Position Requirements:")
    (ul
      (li "Must be at least 18 years old")
      (li "Must have availability for both:")
      (ul
        (li "Summer: 8:30am-4:30pm")
        (li "School year: Initially, must be available Saturdays from 9am-2pm (Feb - May)"))
      (li "Must have experience interacting with K-8th grade students in the past 5 years.")
      (li "Must have valid CPR certification or be able to complete certification before starting this position.")
      (li "Comfortable with computers and technology. In particular, we are looking for someone who nows how to record a screencast and upload the video to Youtube.")
      (li "Strong preference for candidates who have learned a second language (as an adult).")
      (li "Able to pass a background check (expenses reimbursed).")
      (li "Able to obtain a negative TB test (expenses reimbursed). Note: this may not be required at all locations.")
      (li "Must have reliable, personal transportation. (Equipment can not be taken on public transportation for liability reasons.)"))
    (h3 "Please Include in Your Application:")
    (ul
      (li "Your current availability, especially on Saturdays and your expected summer availability.")
      (li "What neighborhoods you're willing to drive to in order to teach classes & camps.")
      (li "Current resume. (If you have one.)"))
    (p "Apply today and join our team!"))
                    ))



(define (start-now-section)
  (container
    (hr)
    (h3 "Not Hiring in Your City?")
    (p class: "mt-3"
       "All of MetaCoders training and curriculum are open source, meaning you can access them and start teaching in your community for free today! We also love to hear from people who want us to come to their community, so reach out to us using the form below and help us bring innovative, science-based coding education to your city!")
    (card-deck
        (email-signup #:title "Have Questions? Email us!" #:interest "Becoming a Coding Coach")
        (begin-training
          (p "Whether you're interested in being hired as a Coding Coach, or you're interested in starting free classes in your area, you can start your training to become a coach now!") 
          (list "coaches" "training.html")))
    (br)))


(define (coaches-top)
  (page coaches-top-path
        (normal-content-wide #:head (list
            (title "Coding Coaches | Apply to Teach Kids Code | MetaCoders")
            (meta name: "description" content: "Coding Coaches teach MetaCoders students in grades K-12th how to code in classes and camps. Coding Coaches are energetic and passionate about coding. Apply today!"))
          (employment-section)
          (start-now-section))))
