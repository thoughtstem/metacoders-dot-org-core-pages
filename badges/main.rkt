#lang at-exp racket
(provide badges)
(require (except-in metacoders-dot-org-lib script)
         (prefix-in normal: metacoders-dot-org-lib)
         website-js/components/l-system
         website-js
         "../topics.rkt"
         "../customer-testimonials.rkt"
         )

(define KEY (make-parameter "pk_live_Kd7tDKVnPMvyCyk5oAuSkbju00pa0xJPPL")
  ;(make-parameter "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA")
  )

(define (gems n) (span n " " (i class:"fas fa-gem")))

(define (badges)
  (page badges-top-path
        (normal-content-wide
          #:head (list (title "Virtual Coding Club from MetaCoders")
                       (meta name: "description" content: "Learn Coding from Live Instructors starting on August 24th")
                       (common-critical-css)
                       (link 'rel: "preconnect" href:"https://q.stripe.com")
                       (link 'rel: "preconnect" href:"https://m.stripe.com")
                       (normal:script src:"https://js.stripe.com/v3")
                       )
          #:defer-css #t
          (include-p5-js)
          (jumbotron-header-section)
          (updated-list-value-prop)
          (credits-section)
          (customer-testimonial-section)
          (topics-section)
          (faq-section)
          )))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "Virtual Coding Club"
    #:tagline "A community of K-10th grade coders of all levels from around the world." 
    #:percent-height "60vh"
    #:image-path online-banner-path
    #:alt-tag "Young boy coding a video game on his laptop."))


(define (updated-list-value-prop)
  (define (padded-li . content)
    (li style: (properties 'padding-top: 10) content))
  (jumbotron class: "mb-0"
             style: (properties background: "white")
             (container
               (h2 "Why Join MetaCoders Virtual Coding Club?")
               (ul 
                 (padded-li (h5 "Live-Taught on Your Schedule!") " MetaCoders knows that you and your family have a lot going on -- now more than ever! Online sessions with our Coding Coaches are offered " (b "every weekday, 1pm to 4pm PT") ". Join us on the hour daily, weekly, or whenever! Our schedule adapts to " (i "you") ".")
                 (padded-li (h5 "Ultimate Flexibility!") " With no session enrollments required, you and your students can decide to join us five minutes in advance, if you want! The absolute low-commitment class with no stress about changing schedules or missing sessions.") 
                 (padded-li (h5 "Customized Student Experience!") "  A range of topics offered daily allows students to design their own education experience around their interest and experience level. MetaCoders' unique Badge System allows students to move though curriculum at the pace that is right for them, track their progress, and pick up right where they left off each day.")
                 (padded-li (h5 "Real People, Real Time!") " Learning at home doesn't have to mean learning alone. Join other coding students from around the world and our experienced Coding Coaches for a social, fun, and educational experience!"))))
)

;needs a header
(define (updated-value-prop)
  (jumbotron class: "mb-0"
             (container
              (h1 "Why Join MetaCoder's Virtual Coding Club?")
               (responsive-row #:columns 2
                               (sched-value-card))
               )
             ))

(define (value-card header image text)
  (card class: "text-black"
        (card-img src: image) 
        (card-img-overlay 
         (h3 header)
         text)
    ))

(define (sched-value-card)
  (value-card "High-Quality Coding Education on Your Schedule"
              (prefix/pathify sched-value-img-path)
              (p "MetaCoders knows that you and your family have a lot going on -- now more than ever! With our drop-in style Virtual Coding Club, you don't have to struggle to cram another daily or weekly class into your calendar. Our schedule adapts to " (i "you") ".")))

(define (topics-section)
  (jumbotron class: "mb-0"
             (container
               (h2 class: "text-center" "What Do Credits " (gems "") " Unlock?" )
               (br)
               (apply (curry responsive-row #:columns 3) (map display-topic (topics)))
               )
             ))

(define (display-topic t)
  t)

(define (credits-section)
  (define (padded-li . content)
    (li style: (properties 'padding-top: 10) content)
    )
  (jumbotron class: "mb-0"
             (container class: "text-center"
               (h2 "Buy Credits " (gems "") " Join Anytime!")
               (br)
               (p "Each Credit " (gems "") " unlocks an hour of personalized education for K-10 students and beyond. " (b "Join at the beginning of any hour, and stick around for one, two or three hours at a time!") " No need to sign up or schedule for days or times.") 
               (br)
               (credit-wheel)
               )))

(define (credit-wheel)
  (define (fancy-col x)
    (div class: "col-lg-4 col-sm-6 col-xs-12" 
         x)
    )
  (list
    (card class: "bg-transparent" style: (properties border: "0px")
      (card-body
        (h3 class: "text-center" "Credit Bundles")
        (row (map fancy-col (credit-button-list)))))
    (br)
    (card class: "bg-transparent" style: (properties border: "0px")
      (card-body
        (h3 class: "text-center" "Credit Subscriptions")
        (row (map fancy-col (credit-button-list #:type 'subscription)))))
    (a name:"topics"))
  )



(define (credit-button-list #:type [type 'one-time])
  (cond
    [(eq? type 'one-time)
     (list
       (credits-buy-button   20   1 0 "sku_Hp2excpd8TsP6O" KEY)
       (credits-buy-button   95   5 0 "sku_Hp2fvDejxx74qp" KEY)
       (credits-buy-button  180  10 0 "sku_Hp2gncz7BjbzxZ" KEY)
       (credits-buy-button  320  20 0 "sku_Hp2gbaJErzCgMC" KEY)
       (credits-buy-button  750  50 0 "sku_Hp2gRBh6YfVjNy" KEY)
       (credits-buy-button 1300 100 0 "sku_Hp2gYZM84N9bg0" KEY)
       ) 
     ]
    [(eq? type 'subscription)
     (list
      (credits-subscription-buy-button   90   5 0 "price_1HFOsoJbkDSuzmy7w22RzIoo" KEY) 
      (credits-subscription-buy-button  170  10 0 "price_1HFP9tJbkDSuzmy75jqgAuNZ" KEY) 
      (credits-subscription-buy-button  320  20 0 "price_1HFPAtJbkDSuzmy78efD3deo" KEY)
      (credits-subscription-buy-button  750  50 0 "price_1HFPBsJbkDSuzmy7NCj1yDXu" KEY)
      (credits-subscription-buy-button 1200 100 0 "price_1HFPCiJbkDSuzmy7KY1ErN0B" KEY)
       )
     ]
    [else
      (error "Must supply one-time or subscription to credit button list")])
  )


(define (learn-more-button)
  "Learn More! Scroll down."
  )


(define (more-description-section)
  (jumbotron  class: "mb-0"
              style: (properties background: "white")
              (container
                (row
                  (col-lg-6 class: "pl-lg-5"
                            (h2 (list"Education Takes a " 
                                  (span style: (properties color: "red" text-decoration: "line-through") "School") 
                                  " Village"))
                            (br)
                            @list{
                            @b{Coding Club} is a chance for students to @b{learn coding and technology} with the guidance of @b{live instructors} while being able to @b{socialize with their peers}. Our goal is to @b{provide zero- to low-cost education} during quarantine by crafting a @b{thriving community} of educators, parents, and students.
                            @br
                            @ul{
                            @li{Students learn @b{new coding skills} every session. Educational activities change daily!}
                            @li{Average @b{1:8 teacher to student ratio} allows our Coding Coaches to engage students in @b{interactive, personalized, interdisciplinary experiences}.}
                            @li{Novel digital classroom models give students the @b{ability to choose} their educational activities, @b{significantly increasing student satisfaction}.}
                          @li{Purchase Credits or @b{earn them for free by volunteering} your time and skills.}
                            @li{Great for coders of all skill levels. Sessions are available for @b{K-2nd}, @b{3rd-6th}, @b{7th-10th}, @b{11th-12th}, @b{College}, and @b{Lifelong Learners}.}
                            @li{Our goal is to @b{make learning coding fun} while we're all stuck at home.}
                            }})
                  (col-lg-6 class: "pr-lg-5"
                            (div class:"embed-responsive embed-responsive-16by9"
                                 (iframe class:"embed-responsive-item" src:"https://www.youtube.com/embed/GVzxUtfTLGE"))
                            (br)
                            (br)
                            (br)
                            (div class: "text-center"
                                 (h4 "Not ready to order yet?")
                                 (a href: "http://eepurl.com/dtmTTT"
                                    (button type: "button" class: "btn btn-warning"
                                            (i class: "fas fa-envelope")
                                            "  Join Our Mailing List for Offers & Updates")))
                            ))
                )
              )
  )





(define (faq-section)
  (local-require website-js/components/accordion-cards)
  (jumbotron  class: "mb-0"
              (container
                (h2 class: "text-center" "Frequently Asked Questions")
                (br)
                (accordion-card #:header (h4 "General")
                                (ol
                                  (li (b "How do Credits work?") " Each Credit can be applied to one 1 hour online session. You can apply the credits you purchase to any of our unfilled scheduled sessions. You do not have to apply all of your purchased credits all at once. We keep track of how many credits each customer has so that you can wait to apply them until a time that is convenient for you!")
                                  (li (b "I purchased Credits! Now, how do I use them to sign up for Coding Club sessions?") " After you purchase, you'll be directed to fill out a short form to send us your students' registration information. Once you have registered, someone from our team will be notified and will email you within the hour to confirm your registration. If you do not receive this email within 2 hours, please call us at (858) 375-4097. If you purchase credits outside of our business hours (Monday-Friday 9am-5pm PST), someone from our team will email you during our next scheduled business hours to confirm your registration.") 
                                  (li (b "How many sessions should I enroll my student in?") " Your child can stay online with us from 1pm - 4pm PST.  Each session starts on the hour, and students can choose to end a session or continue on at each hour mark. Remember, coding is a skill just like playing piano or learning a foreign language: the more time students spend on coding, the stronger their coding skills will become. And with so many fun topics to choose from, students will always be learning new skills!")
                                  (li (b "Do I need to install anything in order to participate?") " Some of our topics will require installing software.  If you are unable or unwilling to install software on your device, there are other topics that do not require anything to be installed.") 
                                  (li (b "Can I still sign up for a session that starts today?") " Yes, you can! Once you purchase Credits, a customer service representative will contact you and send a video conferencing link along with information about scheduling.") 
                                  (li (b "What deals/coupons do you have available?") " We have bulk discount packages that are always available for purchase above. The more credits you purchase in 1 transaction, the less each credit costs.") 
                                  (li (b "What equipment do I need in order to participate?") " All you need to participate in our Coding Club is a computer, a keyboard, and an internet connection! We also ask students to bring paper and pencil to sessions as well. Some of our topics will require that software be installed; if your device doesn’t allow for that, your child can choose another topic.") 
                                  (li (b "Can my 2 or more children share the credits I purchase?") " Students who live within the same household can share credits.") 
                                  (li (b "If my 2 children are sharing 1 laptop, do we pay 2 Credits per session or 1?") " Each device will require 1 Credit. We understand parents don't always have enough devices for all their students. Clearly, two students who are sharing 1 laptop can't code at the same time, so we are treating each device as if it is one student at this time.") 
                                  (li (b "Can parents sit in on the session?") " Yes! Parents observation and participation is welcome and encouraged!") 
                                  (li (b "What if I don't use all my Credits?") " You can review our " (a href:"https://metacoders.org/terms-and-conditions.html" "Terms and Conditions") " for more details.")
                                  (li (b "Do you record Coding Club sessions?") " Yes, in order to be as transparent as possible with parents, we try to record all sessions. Some screen recordings will also be used for marketing purposes. If sessions are used for marketing purposes, we will ensure that no identifying information like names or locations are shown. You can review our Video Publishing and Privacy policy in our " (a href:"https://metacoders.org/terms-and-conditions.html" "Terms and Conditions") ".")
                                  )
                                )
                (accordion-card #:header (h4 "Fall")
                                (ol
                                  (li (b "Do I really not need to schedule my sessions in advance?") " That's right! Throughout the fall, from 1pm-4pm PST, Monday-Friday, just have your student join our emailed video conferencing link, and we will teach them coding! As students \"spend\" their Credits, we'll send you an update if your Credit balance is running low.") 
                                  (li (b "How many Credits should I purchase for this fall?") " You can do a quick estimate by multiplying the number of weeks x 5 days/week x hours per day x number of students. For example, if you have 1 child that you want to register for 3 hours per day for 5 weeks, you'd purchase: (5 weeks x 5 days/week x 3 hours per day x 1 student) = 75 credits.") 
                                  )
                                )
                (accordion-card #:header  
                                (h4 "Volunteers")
                                (ol
                                  (li (b "How do I become a MetaCoders Volunteer?") " Easily! Apply online " (a href: "https://docs.google.com/forms/d/e/1FAIpQLSeGAMm6a6wpmFkikMa5k6QbK9rE3r3_rb22GDLx6UGWi5jdMg/viewform" target: "_blank" "here") " and we will be in touch about the upcoming opportunities soon!")
                                  (li (b "What kind of things do MetaCoders Volunteers do?") " All our volunteers start out with the basics -- you will help out in the classroom and administration tasks. As you become more comfortable with the MetaCoders experience, you will have more creative opportunities and more power to decide how you spend your time.")
                                  (li (b "Are there any prerequisites to volunteering?") " There are no requirements for coding knowledge or teaching experience. For tech, our volunteers usually need a reliable internet connection, computer such as a desktop or laptop that can access online video conferencing, and a webcam/microphone. We do require our volunteers be 17 or older.")
                                  (li (b "Can I get free Credits for friends or family by volunteering?") " This is the best part about being an educational co-op! By putting in your time and energy, you can get free educational opportunities for your friends or family. Volunteers can receive 1 Credit for every 1-hr of volunteer time (that's 1-hr of education for kids for every 1-hr of volunteer time.)")
                                  (li (b "As a volunteer, can I gift my free Credits to someone else?") " Absolutely! You can also gift credits to someone outside your family.")
                                  ))
                )
              ))

(define (display-price price #:suffix [suffix ""])
    (list
      (br)
      (badge-pill-light style: (properties font-size: "12pt")
                        (~p price) suffix)))

(define (credits-buy-button price num discount sku key )
  (list (button-primary id:(~a "checkout-button-" sku)
                        class: "mt-1 btn-block"
                        style: (properties border-radius: "0 0 0.18rem 0"
                                           white-space: "normal"
                                           )
                        (if (> discount 0)
                          (list (gems num) 
                                (s class: "text-danger"
                                   (display-price price))
                                " " (~p (- price discount))
                          )
                          (list (gems num) 
                                (display-price price)))
        (div id:(~a "error-message" sku))
        ;(script src:"https://js.stripe.com/v3")
        @script/inline{
        (function() {
                    var stripe = Stripe('@key');

                    var checkoutButton = document.getElementById('checkout-button-@sku');
                    checkoutButton.addEventListener('click', function () {

                                                    stripe.redirectToCheckout({
                                                                               items: [{sku: '@sku', quantity: 1}],
                                                                               successUrl: 'https://metacoders.org@(prefix/pathify checkout-success-top-path)',
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
  ))

  (define (credits-subscription-buy-button price num discount sku key)
    (list (button-success id:(~a "checkout-button-" sku)
                          class: "mt-1 btn-block" 
                          style: (properties border-radius: "0 0 0.18rem 0"
                                             white-space: "normal")
                          (if (> discount 0)
                            (list (gems num)
                                  (s class: "text-danger"
                                     (display-price price))
                                  " " (display-price (- price discount)
                                                     #:suffix "/mo") 
                            )
                            (list (gems num) 
                                  (display-price price #:suffix "/mo"))))
          (div id:(~a "error-message" sku))
          ;(script src:"https://js.stripe.com/v3")
          @script/inline{
          (function() {
                      var stripe = Stripe('@key');

                      var checkoutButton = document.getElementById('checkout-button-@sku');
                      checkoutButton.addEventListener('click', function () {

                                                      stripe.redirectToCheckout({
                                                                                 items: [{plan: '@sku', quantity: 1}],
                                                                                 successUrl: 'https://metacoders.org@(prefix/pathify checkout-success-top-path)',
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