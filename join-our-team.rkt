#lang at-exp racket

(provide join-our-team)

(require metacoders-dot-org-lib
         ;website-js/components/gradient
         ;website-js/components/boids
         ;website-js/components/pointillism
         website-js/components/l-system)

(define (join-our-team)
  (page join-our-team-path
        (normal-content-wide #:head (list
                                     (title "Part-time Jobs in Computer Science Education | MetaCoders")
                                     (meta name: "description" content: "There are many employment and volunteer opportunities at MetaCoders for individuals passionate about computer science and coding education for kids. Apply today!")
                                     (common-critical-css)
                                     )
                             #:defer-css #t
         (include-p5-js)
          (jumbotron-header-section)
          (main-way-to-work-with-metacoders)
          (other-ways-to-help-metacoders)
          (our-values))))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "Join Our Team"
    #:tagline "You can make a difference in your community by bringing coding education to local students."
    #:percent-height "80vh" 
    #:image-path join-our-team-banner-path
    #:alt-tag "College student mentoring junior high school boy in computer science and coding at university"))

(define (main-way-to-work-with-metacoders)
  (jumbotron  style: (properties
                           text-align: "center"
                           margin-bottom: 0
                           background: "white")
    (container
      (h2 "Make a Difference in Kids' Lives")
      (br)
      (p "MetaCoders is in communities throughout the United States, running classes for students around the world online, and continuing to grow.  We are looking for individuals who support our mission of a world with more computer science education. Our current volunteer opportunities are:")
      (br)
      (div class: "d-flex col-lg-6 col-sm-6 col-xs-12 my-3 px-3" style: "margin: 0 auto;"
           (card ;class: "h-100"
             style: (properties overflow: "hidden"
                                'flex: 1)
             (picture 
               (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path summer-camp-intern-img-path)))
               (source type: "image/jpeg" srcset: (prefix/pathify summer-camp-intern-img-path))
               (card-img-top src: (prefix/pathify summer-camp-intern-img-path)
                             alt: "Summer camp volunteer in computer science education bonds with a young boy at camp"))
             (card-body
               (card-title "Volunteer with Us Online!")
               (card-text
                 (ul style: "text-align:left;"
                   (li "Help bring coding education to students around the globe")
                   (li "Work with our team of skilled educators to build your communication and teaching skills")
                   (li "Learn how to design engaging curriculum")
                   (li "Build your personal technical and coding skills")
                   (li "Delve into what it takes to run a non-profit")
                   )
                 ))
             (card-footer class: "p-0 m-0"
                          (a style: (properties text-decoration: "none") href: summer-camp-intern-top-path 
                             (button-primary class: "btn-block rounded-0" "Learn More")))))    
      )))


(define (other-ways-to-help-metacoders)
  (jumbotron  style: (properties
                           text-align: "center"
                           margin-bottom: 0)
    (container
      (h2 "Other Ways You Can Help")
      (br)
      (p "In addition to volunteer opportunities, we're often looking for employees to help us maximize student outcomes in our classrooms.")
      (br)
      (responsive-row #:columns 2 #:d-flex? #t
        (card ;class: "h-100"
              style: (properties overflow: "hidden"
                                 'flex: 1)
              (picture 
               (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path coding-coach-img-path)))
               (source type: "image/jpeg" srcset: (prefix/pathify coding-coach-img-path))
               (card-img-top src: (prefix/pathify coding-coach-img-path)
                             alt: "Computer science teacher works with young boy enthusiastic about coding video games"))
          (card-body
            (card-title "Become a Coding Coach")
            (card-text "Teach kids in your community how to code!"))
          (card-footer class: "p-0 m-0"
            (a style: (properties text-decoration: "none") href: coaches-top-path 
                     (button-primary class: "btn-block rounded-0" "Learn More"))))
        (card ;class: "h-100"
              style: (properties overflow: "hidden"
                                 'flex: 1)
              (picture 
               (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path tech-coordinator-img-path)))
               (source type: "image/jpeg" srcset: (prefix/pathify tech-coordinator-img-path))
               (card-img-top src: (prefix/pathify tech-coordinator-img-path)
                             alt: "Technology coordinator updating and installing software on lots of chromebooks in office"))
          (card-body
            (card-title "Become a Technology Coordinator")
            (card-text "Help us connect coaches and students in your area!"))
          (card-footer class: "p-0 m-0" 
            (a style: (properties text-decoration: "none") href: tech-coords-top-path 
                     (button-primary class: "btn-block rounded-0" "Learn More")))))   
      )))

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
      (responsive-row #:columns 4 #:d-flex? #t
        (card class: "text-white bg-primary" style: (properties overflow: "hidden" 'flex: 1)
          (card-header class: "font-weight-bold" "Compassion")
          (card-body
            (card-text "A common phrase we use: \"we be good people\". We always exercise compassion when working with our employees, volunteers, parent customers, and students.")))
        (card class: "text-white bg-primary" style: (properties overflow: "hidden" 'flex: 1)
          (card-header class: "font-weight-bold" "Resourcefulness")
          (card-body
            (card-text "It doesn't take the most expensive equipment or the flashiest software to teach coding. Many of us learned at home on our own! Resourcefulness is one way we offer better classes at lower costs.")))
        (card class: "text-white bg-primary" style: (properties overflow: "hidden" 'flex: 1)
          (card-header class: "font-weight-bold" "Adaptability")
          (card-body
            (card-text "We use coding in everything. Our entire team, from coaches to administrators, is always looking for ways to be even more adaptable using the power of code.")))
        (card class: "text-white bg-primary" style: (properties overflow: "hidden" 'flex: 1)
          (card-header class: "font-weight-bold" "Respect")
          (card-body
            (card-text "We respect people of all backgrounds. Respect between teachers and students is paramount in the classroom. The same goes for respect between all levels of staff at MetaCoders.")))))))
