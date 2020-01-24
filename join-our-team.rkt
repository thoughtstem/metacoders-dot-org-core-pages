#lang at-exp racket

(provide join-our-team)

(require metacoders-dot-org-lib
         ;website-js/components/gradient
         ;website-js/components/boids
         ;website-js/components/pointillism
         website-js/components/l-system)

(define (join-our-team)
  (page join-our-team-path
        (normal-content-wide #:head (title "Part-time Jobs in Computer Science Education | MetaCoders")
         (include-p5-js)
          (jumbotron-header-section)
          (two-ways-to-work-with-metacoders)
          (two-other-ways-to-help-metacoders)
          (our-values))))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "Join Our Team"
    #:tagline "You can make a difference in your community by bringing coding education to local students."
    #:percent-height "80vh" 
    #:image-path join-our-team-banner-path))

(define (two-ways-to-work-with-metacoders)
  (jumbotron  style: (properties
                           text-align: "center"
                           margin-bottom: 0
                           background: "white")
    (container
      (h2 "Make a Difference in Kids' Lives")
      (br)
      (p "MetaCoders is in communities throughout the United States, and we are continuing to grow.  We are looking for candidates who support our mission of a world with more computer science education. Our current employment opportunities are:")
      (br)
      (responsive-row #:columns 2
        (card class: "h-100" style: (properties overflow: "hidden")
          (card-img-top src: (prefix/pathify coding-coach-img-path))
          (card-body
            (card-title "Become a Coding Coach")
            (card-text "Teach kids in your community how to code!"))
          (card-footer class: "p-0 m-0"
            (a style: (properties text-decoration: "none") href: coaches-top-path 
                     (button-primary class: "btn-block rounded-0" "Learn More"))))
        (card class: "h-100" style: (properties overflow: "hidden")
          (card-img-top src: (prefix/pathify tech-coordinator-img-path))
          (card-body
            (card-title "Become a Technology Coordinator")
            (card-text "Help us connect coaches and students in your area!"))
          (card-footer class: "p-0 m-0" 
            (a style: (properties text-decoration: "none") href: tech-coords-top-path 
                     (button-primary class: "btn-block rounded-0" "Learn More"))))))))


(define (two-other-ways-to-help-metacoders)
  (jumbotron  style: (properties
                           text-align: "center"
                           margin-bottom: 0)
    (container
      (h2 "Other Ways You Can Help")
      (br)
      (p "In addition to employment opportunities, we're always looking for volunteers and interns to help us maximize student outcomes in our classrooms.")
      (br)
      (responsive-row #:columns 3
        (card class: "h-100" style: (properties overflow: "hidden")
          (card-img-top src: (prefix/pathify volunteer-scientist-img-path))
          (card-body
            (card-title "Volunteer as a Learning Scientist")
            (card-text "Study and monitor MetaCoders classes in your local area to make sure kids have the best classroom experiences."))
          (card-footer class: "p-0 m-0"
            (a style: (properties text-decoration: "none") href: scientists-top-path
              (button-primary class: "btn-block rounded-0" "Learn More"))))
        (card class: "h-100" style: (properties overflow: "hidden")
          (card-img-top src: (prefix/pathify volunteer-coder-img-path))
          (card-body
            (card-title "Volunteer as a Coder")
            (card-text "Help us code open-source educational software that kids around the world can use to create video games, apps, and more!"))
          (card-footer class: "p-0 m-0"
            (a style: (properties text-decoration: "none") href: coders-top-path 
              (button-primary class: "btn-block rounded-0" "Learn More"))))
        (card class: "h-100" style: (properties overflow: "hidden")
          (card-img-top src: (prefix/pathify summer-camp-intern-img-path))
          (card-body
            (card-title "Intern as a Summer Camp Team Leader")
            (card-text "Lead students in our summer camps in coding exercises and make sure they have a great first experience with coding!"))
          (card-footer class: "p-0 m-0"
            (a style: (properties text-decoration: "none") href: summer-camp-intern-top-path 
              (button-primary class: "btn-block rounded-0" "Learn More"))))))))

(define (our-values)
  (l-system  #:step 50
             #:loops 4
             #:max-radius 0
             #:line-color (~a warning "80") ;"rgba(255,193,7,0.4)"
            class: "card px-3 py-5 bg-transparent text-center mb-0"
            style: (properties 'overflow: "hidden")
  ;(jumbotron  style: (properties
  ;                         text-align: "center"
  ;                         margin-bottom: 0
  ;                         background: "white")
    (container
      (h1 "Our Core Values")
      (br)
      (p "We're all in this together! Our core values help us accomplish our mission of creating a world where everyone knows how to code.")
      (br)
      (responsive-row #:columns 4
        (card class: "text-white bg-primary h-100" style: (properties overflow: "hidden")
          (card-header class: "font-weight-bold" "Compassion")
          (card-body
            (card-text "A common phrase we use: \"we be good people\". We always exercise compassion when working with our employees, volunteers, parent customers, and students.")))
        (card class: "text-white bg-primary h-100" style: (properties overflow: "hidden")
          (card-header class: "font-weight-bold" "Resourcefulness")
          (card-body
            (card-text "It doesn't take the most expensive equipment or the flashiest software to teach coding. Many of us learned at home on our own! Resourcefulness is one way we offer better classes at lower costs.")))
        (card class: "text-white bg-primary h-100" style: (properties overflow: "hidden")
          (card-header class: "font-weight-bold" "Adaptability")
          (card-body
            (card-text "We use coding in everything. Our entire team, from coaches to administrators, is always looking for ways to be even more adaptable using the power of code.")))
        (card class: "text-white bg-primary h-100" style: (properties overflow: "hidden")
          (card-header class: "font-weight-bold" "Respect")
          (card-body
            (card-text "We respect people of all backgrounds. Respect between teachers and students is paramount in the classroom. The same goes for respect between all levels of staff at MetaCoders.")))))))
