#lang at-exp racket

(provide donate)

(require metacoders-dot-org-lib
         racket/runtime-path
         ;website-js/components/gradient
         ;website-js/components/boids
         ;website-js/components/pointillism
         website-js/components/l-system)

(define-runtime-path grad-cap-path "./graduation-cap.svg")
(define-runtime-path laptop-path "./laptop.svg")
(define-runtime-path dollar-sign-path "./dollar-sign.svg")
(define-runtime-path school-supplies-path "./school-supplies.svg")

(define grad-cap-icon
  (html/inline (string-replace (file->string grad-cap-path) "<svg" "<svg class=\"donate-color\"")))

(define laptop-icon
  (html/inline (string-replace (file->string laptop-path) "<svg" "<svg class=\"donate-color\"")))

(define dollar-sign-icon
  (html/inline (string-replace (file->string dollar-sign-path) "<svg" "<svg class=\"donate-color\"")))

(define school-supplies-icon
  (html/inline (string-replace (file->string school-supplies-path) "<svg" "<svg class=\"donate-color\"")))

(define (donate-toggle)
  (div class: "btn-group btn-group-toggle mb-2"
       style: (properties width: "100%")
       'data-toggle: "buttons"
       (label class: "btn btn-secondary active"
              style: (properties width: "50%")
              data-target: "#donate-carousel"
              data-slide-to: "0"
              (input type: "radio"
                     name: "options"
                     id: "give-once"
                     ;autocomplete: "off"
                     )
              "GIVE ONCE")
       (label class: "btn btn-secondary"
              style: (properties width: "50%")
              data-target: "#donate-carousel"
              data-slide-to: "1"
              (input type: "radio"
                     name: "options"
                     id: "give-monthly"
                     ;autocomplete: "off"
                     )
              "MONTHLY")))

(define (jumbotron-main-section)
  (jumbotron
   style: (properties
           text-align: "center"
           margin-bottom: 0
           background-image: (string-append "url(" (prefix/pathify donate-banner-path) ")")
           background-size: "cover"
           background-position: "center"
           'min-height: "80vh"
           position: "relative")
   class: "d-flex align-items-center"
   (div style: (properties background-color: "rgba(0,0,0,0.6)"
                           width: "100%"
                           position: "absolute"
                           top: 0
                           left: 0
                           bottom: 0
                           right: 0
                           float: "left"))
   (container
    (col-sm-8 class: "p-4 mx-auto"
         style: (properties color: "white")
         (h1 id: "donate-header" class: "mb-4 text-white"
             "Help Students Code Today")
         (div style: (properties color: "black")
          (donate-toggle)
          (br)
          (carousel id: "donate-carousel"
                    class: "slide"
                    (div class: "carousel-inner" style: (properties 'min-height: 250)
                         (donate-card #:class "carousel-item active"
                                      #:items (list (cons 50  "sku_GLHtNM0O5C5NyD")
                                                    (cons 100 "sku_GLHt1DcczksoCJ")
                                                    (cons 150 "sku_GLHucz0VJ2mjhQ")
                                                    (cons 200 "sku_GLHx11kMc9SFUd")))
                         (donate-card #:class "carousel-item"
                                      #:mode 'monthly
                                      #:items (list (cons 30  "plan_GLI9nfpfvXdxKJ")
                                                    (cons 60  "plan_GLI9iQPh4YLsbP")
                                                    (cons 90  "plan_GLI98MLFTbLtGS")
                                                    (cons 120 "plan_GLIAgOq5MjRN64"))))))))))

(define (what-your-donations-support)
  (jumbotron class: "mb-0 text-center"
             style: (properties background: "white")
    (container ;class: "col-sm-8 mx-auto"
      (h3 "What Your Donations Support")
      (br)
      (table class: "mx-auto"
             (tr (td grad-cap-icon)
                 (td (h6 (b "Financial aid") " to help all students have the opportunity to learn how to code no matter their financial means.")))
             (tr (td laptop-icon)
                 (td (h6 (b "Customized Chromebooks") " filled with MetaCoders curriculum and programming languages for students to use during classes and camps.")))
             (tr (td dollar-sign-icon)
                 (td (h6 (b "Reduced overall costs") " of classes and camps for all families.")))
             (tr (td school-supplies-icon)
                 (td (h6 (b "Classroom supplies") " and learning materials that help keep students engaged. This includes things like badges to earn, toys to earn, kata cards, and more!")))))))

(define (more-ways-to-donate-deck-section)
  (l-system  #:step 50
             #:loops 4
             #:max-radius 0
             #:bg-color "#e9ecef" ;"#f8f9fa"
             #:line-color (~a warning "80")
            class: "card px-3 py-5 bg-transparent text-center mb-0"
            style: (properties 'overflow: "hidden")
  ;(pointillism #:color-1 (~a primary "03") ;"rgba(255, 200, 0, 0.024)"
  ;             #:color-2 (~a warning "01") ;"rgba(237, 70, 41, 0.004)"
  ;             #:bg-color "#f8f9fa"
  ;             class: "card px-3 py-5 bg-transparent mb-0 text-center"
  ;             style: (properties 'overflow: "hidden")
  ;(jumbotron  class: "mb-0 text-center"
              (container ;class: "col-sm-8 mx-auto"
                         (h3 "Other Ways to Donate")
                         (br)
                         (div class: "text-left"
                              (p "At this time, MetaCoders primarily accepts monetary donations to support our efforts in computer science education. There are a few other ways you can donate besides through the donation form above:")
                              (responsive-row #:columns 3
                                    (card class: "h-100"
                                     (card-header (h6 class: "m-0" "Donate by Mail"))
                                     (card-body (p "Mail a check to our headquarters:")
                                                (p (b "2635 Camino del Rio South, Ste 103, San Diego, CA 92108"))
                                                (p "Please include your return mailing address and phone number so that we can send you a donation receipt.")))
                                    (card class: "h-100"
                                     (card-header (h6 class: "m-0" "Donate by Phone"))
                                     (card-body "Call us at "
                                                (b "858-869-9430")
                                                " with payment details and we can take your donation over the phone."))
                                    (card class: "h-100"
                                     (card-header (h6 class: "m-0" "Donate by Email"))
                                     (card-body "If you have a non-monetary donation, please email us at "
                                                (a href: "mailto:contact@metacoders.org" "contact@metacoders.org")
                                                " to see if we are able to accept your donation."))
                               )))))

;success color : #28a745
(define (donate) 
  (page donate-path
    (normal-content-wide #:head (list (link 'rel: "preconnect" href:"https://q.stripe.com")
                                      (link 'rel: "preconnect" href:"https://m.stripe.com")
                                      (script src:"https://js.stripe.com/v3"))                                    
     (include-p5-js)
     @style/inline[type: "text/css"]{
      .donate-color { height: 42px; width: 42px; margin-right:10px; fill: @primary; }
      .btn.btn-secondary:not(:disabled):not(.disabled).active {background-color:#222;}
      .card-header {background-color: @primary; color: white;}            
      tr {height: 60px;}
     }
      (jumbotron-main-section)
      (what-your-donations-support)
      (more-ways-to-donate-deck-section)
      #;(script/inline type: "text/javascript"
                   "function randomColor(){
                      var icons = document.getElementsByClassName('donate-color');
                      var buttons = document.getElementsByClassName('btn-success');
                      var myColors = ['#dc3545','#ffc107','#28a745','#007bff','#17a2b8'];
                      var aColor = myColors[Math.floor(Math.random() * myColors.length)];
                      for (const icon of icons){
                        icon.style.fill = aColor;
                      }
                      for (const button of buttons){
                        button.style.backgroundColor = aColor;
                        button.style.borderColor = aColor;
                      }
                      var header = document.getElementById('donate-header');
                      header.style.textShadow = '-2px 2px ' + aColor;
                    }
                    randomColor();"))))
