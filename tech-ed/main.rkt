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
          (class-schedule)
          (contact-us)
          (faq-section2)
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

(define (class-schedule)
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
    (row ;when we add more classes, change to responsive-row
     (div class: "col-md-8 col-lg-6 mx-auto"
          (card class: "border-primary"
                (picture 
                 (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path seniors-zoom-coding-path)))
                 (source type: "image/jpeg" srcset: (prefix/pathify seniors-zoom-coding-path))
                 (card-img-top class: "border-bottom"
                               src: (prefix/pathify summer-camp-intern-img-path)
                               alt: "A group of older adults learning coding in an online class."))
                (card-body class: "text-center"
                 (card-title "Intro to Coding: Shapes and Art")
                 (card-text class: "text-left"
                            "Get creative with code! Start your journey into computer programming by creating shapes and pictures in the LISP language Scheme. Learn by doing! Our beginniner-friendly curriculum will have you coding in no time. Code in a free online coding editor; no installation required.") 
                 (table class: "table table-sm table-bordered text-left"
                        (tr (td (strong "Time: ")) (td "Fridays, 10:30am - 11:30am PT"))
                        (tr (td (strong "Dates: ")) (td "10/2, 10/9, 10/16, 10/23"))))
                (card-footer
                 class: "p-0 m-0"
                 (class-purchase-button 70 0 "sku_HwtZZ6Ny1F9oxb" KEY))))))))


(define (class-purchase-button price discount sku key)
  (list (button-primary id: (~a "checkout-button-" sku)
                        class: "btn-block rounded-0"
                        (if (> discount 0)
                              (list "Click Here to Enroll for "
                                    (s class: "text-danger"
                                       (~p price))
                                    " " (~p (- price discount)))
                              (~a "Click Here to Enroll for " (~p price))))
        (div id:(~a "error-message-" sku))
        @script/inline{
        (function() {
                    var stripe = Stripe('@key');

                    var checkoutButton = document.getElementById('checkout-button-@sku');
                    checkoutButton.addEventListener('click', function () {

                                                    stripe.redirectToCheckout({
                                                                               items: [{sku: '@sku', quantity: 1}],
                                                                               successUrl: 'https://metacoders.org@(prefix/pathify tech-ed-checkout-success-top-path)',
                                                                               cancelUrl: 'https://metacoders.org@(prefix/pathify checkout-fail-top-path)',
                                                                               billingAddressCollection: 'required',
                                                                               })
                                                    .then(function (result) {
                                                                   if (result.error) {
                                                                   var displayError = document.getElementById('error-message@sku');
                                                                   displayError.textContent = result.error.message;
                                                                   }
                                                                   });
                                                    });
                    })();})
  )

(define (contact-us)
  (jumbotron class: "mb-0 text-center bg-white"
   (container
    (div class: "col-md-8 mx-auto"
     (card class: "border-warning"
      (card-header class: "h6 bg-warning text-white" "Group Discounts and Custom Classes!")
      (card-body class: "text-left"
       (card-text (b "Attention leaders and members of adult learning communities, senior support programs, and senior living facilities!")
                  (p "MetaCoders is pleased to offer offer bulk pricing discounts and custom classes for groups of lifelong learners. Bring high-quality, online education directly to the members of your community.")
                  (hr)
                  (h6 class: "text-center" "Contact Us for More Information")
                  (ul class: "list-unstyled text-center"
                      (li (a href: "tel:858-375-4097" "(858) 375-4097"))
                      (li (a href:"mailto: contact@metacoders.org" "contact@metacoders.org"))
                      (li "Monday - Friday, 9am-5pm PT")))))))))


; copied from coding-club
; TODO: refactor out?
; Customized accordian-card
; Todo: remove button-link and just turn the entire header into a link
(define (accordion-card-faq 
           #:header (header "Click to show")
           #:shown? (shown? #f)
           . content)
  (enclose
   (card
    class: "border-primary mb-2"
    (card-header class: "p-0 bg-primary"
     (button-link class: "btn-block bg-transparent m-0 text-white text-left"
                  on-click: (call 'toggle)
       header))
    (div id: (id 'collapse1)
         class: (~a "collapse " (if shown? "show" ""))
      (card-body
       content)))
   (script ([toToggle (id 'collapse1)])
     (function (toggle)
       @js{$("#"+@toToggle).toggle()}))))


(define (faq-section)
  (jumbotron class: "mb-0 text-center"
              (container
                (h2 class: "text-center" "Frequently Asked Questions")
                (br)
                (accordion-card-faq #:header (h4 class: "mb-0" "General")
                                (ol
                                  (li (b "Do I need to install anything in order to participate?") " Our classes are taught through the video conferencing software Zoom which can be accessed directly through your internet browser or through their free downloadable application. For the smoothest experience, we recommend installing Zoom, but it is not required. Additionally, some of our class topics will require installing software. If your class requires software to be installed, you will receive an email with instructions in advance of the class.")
                                  (li (b "Is there a minimum experience level required for these classes?") " Our Tech Ed for Lifelong Learners are designed to be accessible for students of all levels. Our classes are run entirely online using the video conferencing software Zoom and students do need to be able to log on to the class. Once online, we will take care of the rest!")
                                  (li (b "Can I still sign up for a class that starts today?") " Yes, you can! Classes remain open until the start time of the first session.") 
                                  (li (b "What equipment do I need in order to participate?") " All you need to participate in our Tech Ed for Lifelong Learner courses is a computer, a keyboard, and an internet connection! Our classes are taught through the video conferencing software Zoom which can be accessed directly through your internet browser or through their free downloadable application. For the smoothest experience, we recommend installing Zoom, but it is not required. Additionally, some of our class topics will require installing software. If your class requires software to be installed, you will receive an email with instructions in advance of the class.") 
                                  (li (b "Can two people in the same household sign up as one student?") " Students who live within the same household can share a computer and join our class with one enrollment.  However, if you will log in from two separate devices, we ask that each student sign up separately.") 
                                  (li (b "Do you record Tech Ed for Lifelong Learners classes?") " Yes, in order to provide the highest level of quality for our students while creating a safe online community, we record many sessions. Some screen recordings will also be used for marketing purposes. If sessions are used for marketing purposes, we will ensure that no identifying information like names or locations are shown. You can review our Video Publishing and Privacy policy in our " (a href:"https://metacoders.org/terms-and-conditions.html" "Terms and Conditions") ".")
                                  (li (b "Can you create a custom class for me and my friends/community?") " Yes, we are happy to create custom classes that suit your interests and schedule!  Email us at " (a href:"mailto: contact@metacoders.org" "contact@metacoders.org") " for more information.") 
                                  )
                                )
                )
              ))

(define (faq-section2)
  (jumbotron class: "mb-0 text-center"
             (container
              (h2 class: "text-center" "Frequently Asked Questions")
              (br)
              (accordion-card-faq #:header (h6 class: "mb-0" "Do I need to install anything in order to participate?")
                                  (p class: "text-left"
                                     "Our classes are taught through the video conferencing software Zoom which can be accessed directly through your internet browser or through their free downloadable application. For the smoothest experience, we recommend installing Zoom, but it is not required. Additionally, some of our class topics will require installing software. If your class requires software to be installed, you will receive an email with instructions in advance of the class."))
              (accordion-card-faq #:header (h6 class: "mb-0" "Is there a minimum experience level required for these classes?")
                                  (p class: "text-left"
                                     "Our Tech Ed for Lifelong Learners are designed to be accessible for students of all levels. Our classes are run entirely online using the video conferencing software Zoom and students do need to be able to log on to the class. Once online, we will take care of the rest!"))
              (accordion-card-faq #:header (h6 class: "mb-0" "Can I still sign up for a class that starts today?")
                                  (p class: "text-left"
                                     "Yes, you can! Classes remain open until the start time of the first session."))
              (accordion-card-faq #:header (h6 class: "mb-0" "What equipment is required?")
                                  (p class: "text-left"
                                     "All you need to participate in our Tech Ed for Lifelong Learner courses is a computer, a keyboard, and an internet connection! Our classes are taught through the video conferencing software Zoom which can be accessed directly through your internet browser or through their free downloadable application. For the smoothest experience, we recommend installing Zoom, but it is not required. Additionally, some of our class topics will require installing software. If your class requires software to be installed, you will receive an email with instructions in advance of the class."))
              (accordion-card-faq #:header (h6 class: "mb-0" "Can two people in the same household sign up as one student?")
                                  (p class: "text-left"
                                     "Students who live within the same household can share a computer and join our class with one enrollment.  However, if you will log in from two separate devices, we ask that each student sign up separately."))

              (accordion-card-faq #:header (h6 class: "mb-0" "Do you record Tech Ed for Lifelong Learners classes?")
                                  (p class: "text-left"
                                     "Yes, in order to provide the highest level of quality for our students while creating a safe online community, we record many sessions. Some screen recordings will also be used for marketing purposes. If sessions are used for marketing purposes, we will ensure that no identifying information like names or locations are shown. You can review our Video Publishing and Privacy policy in our " (a href:"https://metacoders.org/terms-and-conditions.html" "Terms and Conditions") "."))
              (accordion-card-faq #:header (h6 class: "mb-0" "Can you create a custom class for me and my friends/community?")
                                  (p class: "text-left"
                                     "Yes, we are happy to create custom classes that suit your interests and schedule!  Email us at " (a href:"mailto: contact@metacoders.org" "contact@metacoders.org") " for more information."))
              )
             )
  )