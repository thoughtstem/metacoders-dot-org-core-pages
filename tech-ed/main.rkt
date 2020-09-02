#lang at-exp racket

(provide tech-ed)

(require (except-in metacoders-dot-org-lib script)
         (prefix-in normal: metacoders-dot-org-lib)
         website-js/components/l-system
         website-js
         )

(define KEY (make-parameter "pk_live_Kd7tDKVnPMvyCyk5oAuSkbju00pa0xJPPL")
  ;(make-parameter "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA")
  )

(define (gems n) (span n " " (i class:"fas fa-gem")))

(define (tech-ed)
  (page tech-ed-top-path
        (normal-content-wide
          #:head (list (title "Tech Ed for Lifelong Learners")
                       (meta name: "description" content: "Engage with the technology that surrounds us; learn to speak the language of code!")
                       (common-critical-css)
                       (link 'rel: "preconnect" href:"https://q.stripe.com")
                       (link 'rel: "preconnect" href:"https://m.stripe.com")
                       (normal:script src:"https://js.stripe.com/v3")
                       )
          #:defer-css #t
          (include-p5-js)
          (jumbotron-header-section)
          (updated-list-value-prop)
          (tech-skills-signup)
          )))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "Tech Ed for Lifelong Learners"
    #:tagline "Engage your logical mind & creativity. Learn how to code!" 
    #:percent-height "60vh"
    #:image-path senior-hands-on-keyboard-path
    #:alt-tag "Hands of an older adult on a keyboard."))


(define (updated-list-value-prop)
  (jumbotron class: "mb-0 text-center bg-white"
             (container
              (h2 "Build technological skills, confidence, & knowledge!")
              (responsive-row #:columns 4 #:d-flex? #t
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "h6 bg-warning text-white" "Engage the Active Mind!")
                                    (card-body
                                     "Looking for a new kind of puzzle to solve? Or a new creative outlet? Just looking to try something new? Scientists have seen it over and over; nothing is better for the brain than learning. Exercise the mind with fun, creative coding puzzles while you build brand new skills!"))
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "h6 bg-warning text-white" "Create New Connections!")
                                    (card-body
                                     "MetaCoders believes that learning is a social experience. That is why all our programming is live-taught in online, video classes with like-minded learners. Our classes become learning communities that motivate and learn from each other as much as from our Coding Coaches!"))
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "h6 bg-warning text-white" "Long-Distance, High-Standard!")
                                    (card-body
                                     "Get quality education brought to you -- safely through your computer screen! MetaCoders curriculum is designed specifically for remote learning. Our Coding Coaches guide you at the pace that is right for you; always ready with a helpful tip or the next challenge. With MetaCoders, you don't need to sacrifice quality for convenience."))
                              (card class: "border-warning" style: (properties 'flex: 1)
                                    (card-header class: "h6 bg-warning text-white" "Build Skills You'll Use!")
                                    (card-body
                                     "As you learn how to code, you will learn about the logic and language that runs so many of the objects in our daily lives -- from our phones to our cars to our televisions! You will see gains in your comfort and confidence with technology through practice and understanding."))))

              ))

(define (tech-skills-signup)
  (l-system   #:x "240"
              #:y "p.height/3*2"
              #:start-angle -150
              #:step 18
              #:angle 90
              #:axiom "FX"
              #:loops 16
              #:rules (list (cons "X" "X+YF+")
                            (cons "Y" "-FX-Y"))
              #:bg-color "#e9ecef"
              #:line-color (~a primary 66);"rgba(255,193,7,0.4)"
              #:max-radius 0
              class: "card px-3 py-5 mb-0 bg-transparent"
              style: (properties 'overflow: "hidden")
              (container
               (card class: "border-primary"
                (card-header class: "h5 bg-primary text-white text-center"
                             "Submit the form below for more information!")
                (card-body
                 (form action: "https://docs.google.com/forms/u/1/d/e/1FAIpQLSe8Qas_4iDdxHLQp8JlVsKBJWyxDn6jBVjfHV5J5rew3RfIUA/formResponse"
                       ;https://docs.google.com/forms/d/e/1FAIpQLSe8Qas_4iDdxHLQp8JlVsKBJWyxDn6jBVjfHV5J5rew3RfIUA
                       ;entry.1054010153=sonny
                       ;entry.470834101=sonny@email.com
                       ;entry.584219301=python
                       (div class:"form-group"
                            (label "Name")
                            (input type: "text" class: "form-control" name: "entry.1054010153"))
                       (div class:"form-group"
                            (label "Email")
                            (input type:"email" class: "form-control" name: "entry.470834101"))
                       (div class:"form-group"  
                            (label "What do you want to tell us? e.g. A different time for our online session (please specify your timezone), a specific topic you're interested in learning.")
                            (input type: "text" class: "form-control" name: "entry.584219301"))
        
                       (button-primary type: "submit" name: "submit"
                                       "Submit"))
                 (br)
                 (container class: "text-center"
                            (i "Thank you for your interest. You will hear back from our team soon with more details.")))))))
