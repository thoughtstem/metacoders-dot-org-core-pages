#lang at-exp racket
(provide online)
(require metacoders-dot-org-lib
         website-js/components/l-system
         )

(define KEY (make-parameter "pk_live_Kd7tDKVnPMvyCyk5oAuSkbju00pa0xJPPL")
            ;(make-parameter "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA")
  )


(define (online)
  (page online-top-path
        (normal-content-wide
         #:head (list (title "Quarantine Coding Club from MetaCoders")
                      (meta name: "description" content: "Online coding club for kids and young adults that teaches coding through interdisplinary topics.")
                      (common-critical-css)
                      (link 'rel: "preconnect" href:"https://q.stripe.com")
                      (link 'rel: "preconnect" href:"https://m.stripe.com")
                      (script src:"https://js.stripe.com/v3")
                      )
         #:defer-css #t
         (include-p5-js)
         (jumbotron-header-section)
         (club-description-section)
         (subject-description-section)
         (schedule-section)
         (credits-section)
         (faq-section)
         )))

(define (jumbotron-header-section)
  (mc-jumbotron-header
      #:title "Quarantine Coding Club"
      #:tagline "Learn coding alongside interdisciplinary subjects from home while you quarantine!"
      #:percent-height "60vh"
      #:image-path online-banner-path
      #:alt-tag "Two young girls become friends while they were enrolled in a coding camp"))

(define (club-description-section)
  (jumbotron  class: "mb-0"
              style: (properties background: "white")
              (container
                (row
                  (col-md-6 class: "pl-md-5"
                            (h2 "Stuck at Home? Learn with Us!")
                            (br)
                            @list{Join us for @b{Quarantine Coding Club}, and learn new coding skills every day, Monday - Friday. With a 1:5 teacher to student ratio, our expert Coding Coaches deliver @b{interactive, personalized, interdisplinary experiences} to kids, teens, and young adults at home while we all shelter-in-place together. Using @b{Quarantine Credits}, sign up for any 1-hr session that fits your schedule; there will be @b{different skills and topics covered each day}. Our Quarantine Coding Club is great for coders of all skill levels from 2nd grade through young adults. Our goal is to @b{make learning coding fun} while we're all stuck at home.})
                            (col-md-6 class: "pr-md-5"
                                      (picture 
                                        (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path coding-club-img-path)))
                                        (source type: "image/jpeg" srcset: (prefix/pathify coding-club-img-path))
                                        (img src: (prefix/pathify covid-class-img-path) 
                                             class: "img-fluid rounded d-block w-100 border border-dark"
                                             alt: "Screenshot of a Quarantine Coding Club session in action with a Coding Coach and students coding in Racket")) 

                                      ))
                  )
                )
              )

(define (subject-description-section)
  (jumbotron  class: "mb-0"
    (container
      (h2 class: "text-center" "Coding Club Subjects")
      (row
        (col-md-4 class: "pl-md-5"
                  (picture 
                    (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path covid-class-img-path)))
                    (source type: "image/jpeg" srcset: (prefix/pathify covid-class-img-path))
                    (img src: (prefix/pathify covid-class-img-path) 
                         class: "img-fluid rounded d-block w-100"
                         alt: "Child's drawing of a superhero coder fighting off COVID-19")) 
                  )
        (col-md-8 class: "pr-md-5"
                  (br)
                  (h4 "Conquer COVID with Coding")
                  (p "We have 2 different sessions you can join each day: A or B. In "
                     (b class: "text-primary" "Session A")
                     " each day, our Coding Coaches will educate students in a "
                     (b class: "text-primary" "kid-friendly")
                     " way about current events through coding. In "
                     (b class: "text-warning" "Session B")
                     ", we'll move through similar content, but at a "
                     (b class:"text-warning" "faster pace")
                     " intended for older students (like "
                     (b class:"text-warning" "teens or adults")
                     ", or students with more background knowledge). Depending on what day you join us, students may "
                     (b "code")
                     " graphs, showing how they can prevent the spread of COVID-19 by staying home with their families, or maps that show where coronavirus lives right now. "
                     (b "Learn coding")
                     " , while "
                     (b "developing a better understanding")
                     " of how you can be apart of the solution!")
                  ))
      (row 
        (col-md-4 class: "pl-md-5")
        (col-md-8 class: "pr-md-5" 
                  (h4 "More Subjects are coming soon!")))
      )
  )
)

(define (schedule-section)
  (local-require website-js/components/calendar
                 gregor)
  (jumbotron  class: "mb-0"
              style: (properties background: "white"
                                 text-align: "center"
                                 )
    (container
      (h2 class: "text-center" "Quarantine Coding Club Schedule")
      (br)

      (calendar2 (date 2020 04)
                (hash
                  6 (list (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  7 (list (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  8 (list (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  9 (list (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  10 (list (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  13 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  14 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  15 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  16 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  17 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  20 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  21 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  22 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  23 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  24 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  27 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  28 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  29 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  30 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                           (timeslot-chip-b "12pm-1pm" "COVID B")
                           (timeslot-chip-a "3pm-4pm" "COVID A")
                           (timeslot-chip-b "3pm-4pm" "COVID B"))
                  )
                ) 
     
      (br)

      (calendar (date 2020 05)
                (hash
                  1 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  4 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  5 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  6 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  7 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  8 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  11 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  12 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  13 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  14 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  15 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  18 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  19 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  20 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  21 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  22 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  25 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  26 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  27 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  28 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  29 (list (timeslot-chip-a "12pm-1pm" "COVID A")
                          (timeslot-chip-b "12pm-1pm" "COVID B")
                          (timeslot-chip-a "3pm-4pm" "COVID A")
                          (timeslot-chip-b "3pm-4pm" "COVID B"))
                  )
                )
      
      (br)
      
      (h4 "Looking for a different time or have ideas for other topics? ")
      (a href: "https://docs.google.com/forms/d/e/1FAIpQLSfQQIKgK4SmeRoKqTuxd-7jrix-GgdJVLHugvOhIVXFjRVJpQ/viewform" 
         (button-primary id: "main-button" 
                         "Suggestions Form"))
      )
  )
)

(define (timeslot-chip-a timeframe subject)
  (badge-pill-primary (~a timeframe ": " subject)))

(define (timeslot-chip-b timeframe subject)
  (badge-pill-warning (~a timeframe ": " subject)))

(define (credits-section)
  (jumbotron  class: "mb-0"
              style: (properties text-align: "center"
                                 )
    (container
      (h2 class: "text-center" "Purchase Quarantine Credits")
      (br)
      (row 
        (col-md-4
          (credits-buy-button 15 1 0 "sku_GyG3n6kfimeXl9" KEY)
          )
        (col-md-4
          (credits-buy-button 100 10 0 "sku_GyG4rL6NDcH2SX" KEY)
          )
        (col-md-4
          (credits-buy-button 210 30 0 "sku_GyG5ryZxuC66T0" KEY)
          ))
      (br)
      (row 
        (col-md-4
          (credits-subscription-buy-button 60 5 0 "plan_GyG8bSagiSzGYL" KEY)
          )
        (col-md-4
          (credits-subscription-buy-button 90 10 0 "plan_GyG7sMQhs4yHp2" KEY)
          )
        (col-md-4
          (credits-subscription-buy-button 160 20 0 "plan_GyG88V93YibSkE" KEY)
          )
        )
      )
  )
)


(define (faq-section)
  (jumbotron  class: "mb-0"
              style: (properties background: "white"
                                 )
    (container
      (h2 class: "text-center" "Frequently Asked Questions")
      (br)
      (ol
        (li (b "How do the Quarantine Credits work?") " Each Quarantine Credit can be applied to one 1 hour online session. You can apply the credits you purchase to any of our unfilled scheduled sessions. You do not have to apply all of your purchased credits all at once. We keep track of how many credits each customer has so that you can wait to apply them until a time that is convenient for you!")
        (li (b "How many sessions should I enroll my student in?") " We recommend no more than 1 session per day. Sessions within the same day will essentially be covering the same material. The material for sessions varies significantly from day-to-day.")
        (li (b "Do I need to install anything in order to participate?") " Yes. Our coaches teach through the free platform Zoom, which would need to be installed on your computer. You can find installation instructions for the Zoom Client for Meetings " (a href: "https://zoom.us/download" "here") ". Depending on the session, you may also be asked to install certain coding language environments on your computer, or Coaches may walk students through this installation process during a session.") 
        (li (b "Can I still sign up for a session that starts today?") " You can sign up for any scheduled session, that is not yet full, up until 1 hour before the session begins. Please note: at this time, a customer service representative will call you to help you register for sessions. We are currently in the process of building an interface for customers to apply their credits to sessions themselves.") 
        (li (b "What deals/coupons do you have available?") " We have bulk discount packages that are always available for purchase above. The more credits you purchase in 1 transaction, the less each credit costs.") 
        (li (b "How do I sign up for Coding Club sessions with my purchased Quarantine Credits?") " If you purchase credits during our business hours (Monday-Friday 9am-5pm PST), someone from our team will be notified and will call to help you get enrolled in any of our unfilled sessions. If you do not receive a call within 30 minutes, please call us at (858) 375-4097. If you purchase credits outside of our business hours (Monday-Friday 9am-5pm PST), someone from our team will call you during our next scheduled business hours to help you get enrolled in any of our unfilled sessions.") 
        (li (b "Is the calendar above up-to-date?") " We are currently in the process of building a more robust interface to show customers are unfilled sessions. In the meantime, we are trying to keep the calendar above up-to-date as best we can. However, depending on how quickly spots in our sessions fill, some sessions may be full by the time we help you schedule your sessions. But not to worry: we'll work with you to make sure we can find a spot in a session that works with your schedule.") 
        (li (b "What equipment do I need in order to participate?") " All you need to participate in our Quarantine Coding Club is a computer, a keyboard, and an internet connection!") 
        (li (b "Can my 2 or more children share the credits I purchase?") " Students who live within the same household can share credits.") 
        (li (b "Can parents sit in on the session?") " Yes! Parents observation and participation is welcome and encouraged!") 
      )
  )
))


(define (credits-buy-button price num discount sku key #:suffix [suffix ""])
  (list (button-primary id:(~a "checkout-button-" sku)
                        class: "m-0 col-sm-12"
                        style: (properties border-radius: "0 0 0.18rem 0"
                                           white-space: "normal")
                        (if (> discount 0)
                              (list "Buy " num " Credits for "
                                    (s class: "text-danger"
                                       (~p price))
                                    " " (~p (- price discount))
                                    suffix)
                              (~a "Buy " num " Credits for " (~p price) suffix)))
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
 )

(define (credits-subscription-buy-button price num discount sku key #:suffix [suffix ""])
  (list (button-primary id:(~a "checkout-button-" sku)
                        class: "m-0 col-sm-12" 
                        style: (properties border-radius: "0 0 0.18rem 0"
                                           white-space: "normal")
                        (if (> discount 0)
                              (list "Monthly Subscription:" (br) num " Credits for "
                                    (s class: "text-danger"
                                       (~p price))
                                    " " (~p (- price discount)) "/Month"
                                    suffix)
                              (~a "Monthly Subscription: " num " Credits for " (~p price) "/Month" suffix)))
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

        
