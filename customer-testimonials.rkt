#lang at-exp racket

(provide customer-testimonial-section)
(require (except-in metacoders-dot-org-lib script)
         (prefix-in normal: metacoders-dot-org-lib)
         website-js/components/l-system
         website-js
         )

(define (customer-testimonial-section)
  (jumbotron id: "customer-testimonial-banner"
             style: (properties
                      background-position: "center"
                      background-size: "initial"
                      position: "relative")
             class: "d-flex justify-content-center text-center m-0 px-0"
             role: "img"
             `aria-label: "background image"
             @style/inline[type: "text/css"]{
             .no-webp #customer-testimonial-banner{
             background-image: url(/img/online/circuits-background.jpg) !important;
             }
             .webp #customer-testimonial-banner{
             background-image: url(/img/online/circuits-background.webp) !important;
             }
             }
             (div class: "overlay"
                  style: (properties
                           background-color: "rgba(0, 0, 0, 0.6)"
                           width: "100%"
                           position: "absolute"
                           top: 0
                           left: 0
                           bottom: 0
                           right: 0
                           float: "left"))
             (container class: "m-0 p-0"
               (div id: "carouselExampleFade" class: "carousel slide carousel-fade" 'data-ride: "carousel"
                    (div class: "carousel-inner w-75 mx-auto text-left"
                         (div class: "carousel-item text-white active"
                              (h2 "\"My daughter looks forward to each and every class. They keep her engaged and often she continues to experiment with the code after class is over. I would recommend to any student at all interested in technology as this is the way to get them introduced at a young age.\"")
                              (br)
                              (h4 class: "text-right" "Veronica L.")
                              (p class: "text-right" "Parent of a 9 year-old")
                              )
                         (div class: "carousel-item text-white"
                              (h2 "\"Coding is a great starting block for any kid to teach discipline and especially attention to details. Thank you MetaCoders for giving my boys something to look forward to during the tough stay at home days!\"")
                              (br)
                              (h4 class: "text-right" "Robert M.")
                              (p class: "text-right" "Parent of a 12 year-old")
                              )
                         (div class: "carousel-item text-white"
                              (h2 "\"My daughter loves her coding class with MetaCoders. She is learning something new every time! The activities are a lot of fun and keep her engaged. I would highly recommend this class to every student who wants to delve into coding\"")
                              (br)
                              (h4 class: "text-right" "Colette V.")
                              (p class: "text-right" "Parent of an 11 year-old")
                              )
                         (div class: "carousel-item text-white"
                              (h2 "\"This is the best online class my boys have ever attended. The teachers are engaging. The classes are interesting and fun. I am very very impressed by their professional and fun program!\"")
                              (br)
                              (h4 class: "text-right" "Allison S.")
                              (p class: "text-right" "Parent of a 7 and 9 year-old")
                              )
                         )
                    (a class: "carousel-control-prev" href: "#carouselExampleFade" role: "button" 'data-slide: "prev"
                       (span class: "carousel-control-prev-icon" 'aria-hidden: "true")
                       (span class: "sr-only" "Previous")
                       )
                    (a class: "carousel-control-next" href: "#carouselExampleFade" role: "button" 'data-slide: "next"
                       (span class: "carousel-control-next-icon" 'aria-hidden: "true")
                       (span class: "sr-only" "Next")
                       )
                    )
               )
             ))