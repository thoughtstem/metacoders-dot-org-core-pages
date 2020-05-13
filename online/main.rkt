#lang at-exp racket
(provide online)
(require (except-in metacoders-dot-org-lib script)
         (prefix-in normal: metacoders-dot-org-lib)
         website-js/components/l-system
         website-js
         )

(define KEY (make-parameter "pk_live_Kd7tDKVnPMvyCyk5oAuSkbju00pa0xJPPL")
  ;(make-parameter "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA")
  )

(define (gems n) (span n " " (i class:"fas fa-gem")))

(define (online)
  (page online-top-path
        (normal-content-wide
          #:head (list (title "Quarantine Coding Club from MetaCoders")
                       (meta name: "description" content: "Learn Coding from Live Instructors Right Now or Throughout the Summer")
                       (common-critical-css)
                       (link 'rel: "preconnect" href:"https://q.stripe.com")
                       (link 'rel: "preconnect" href:"https://m.stripe.com")
                       (normal:script src:"https://js.stripe.com/v3")
                       )
          #:defer-css #t
          (include-p5-js)
          (jumbotron-header-section)
          (value-prop-section)
          (topics-section)
          (customer-testimonial-section)
          (club-description-section)
          (volunteer-section)
          (faq-section)
          )))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "Quarantine Coding Club"
    #:tagline "Learn Coding from Live Instructors in our Digital Classrooms while we're all in Quarantine!" 
    #:percent-height "60vh"
    #:image-path online-banner-path
    #:alt-tag "Young boy coding a video game on his laptop while he's in quarantine during the COVID-19 pandemic."))


(define (value-prop-section)
  (jumbotron class: "mb-0"
             style: (properties background: "white")
             (container
(row
  (col-lg-6
               (h2 "Buy credits, unlock everything!")
               (p "Each Quarantine Credit unlocks an hour of personalized education. Quarantine Coding Club is the most flexible online class there is:")
               (ul
                 (li "We have " (b "over " (length (topics)) " coding " (a href:"#topics" "topics")) " to choose from, with curriculum changing daily.")
                 (li (b "Current Availability") " (Now thru June 12): M-F 12pm-1pm or 3pm-4pm PST; Tu/Th 2pm-3pm PST; or request a new timeslot " (a href: "https://docs.google.com/forms/d/e/1FAIpQLSfQQIKgK4SmeRoKqTuxd-7jrix-GgdJVLHugvOhIVXFjRVJpQ/viewform" "here") ".") 
                 (li (b "Summer Availability") " (June 15 - August 21): 9am-4pm PST") 
                 (li "Starting this Summer: No pre-scheduling required! Just purchase credits and show up when it's convenient!") 
                 (li "Join our thriving educational community by purchasing Quarantine Credits today!"))
    
    )
  (col-lg-6
    (picture 
      (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path coding-club-img-path)))
      (source type: "image/jpeg" srcset: (prefix/pathify coding-club-img-path))
      (img src: (prefix/pathify coding-club-img-path) 
           class: "img-fluid rounded d-block w-100 border border-dark"
           alt: "Screenshot of a Quarantine Coding Club session in action with a Coding Coach and students coding in Racket"))
    )
  )
               (br)
               (credit-wheel)
               ;(learn-more-button)
               )
             )
  )

(define (credit-wheel)
  (define (fancy-col x)
    (div class: "col-lg-4 col-sm-6 col-xs-12" 
         x)
    )
  (list
    (card style: (properties border: "0px")
      (card-body
        (h3 class: "text-center" "Credit Bundles")
        (row (map fancy-col (credit-button-list)))))
    (br)
    (card style: (properties border: "0px")
      (card-body
        (h3 class: "text-center" "Credit Subscriptions")
        (row (map fancy-col (credit-button-list #:type 'subscription)))))
    (a name:"topics"))
  )



(define (credit-button-list #:type [type 'one-time])
  (cond
    [(eq? type 'one-time)
     (list
       (credits-buy-button 15 1 0 "sku_GyG3n6kfimeXl9" KEY)
       (credits-buy-button 120 10 0 "sku_GyG4rL6NDcH2SX" KEY)
       (credits-buy-button 240 20 0 "sku_GyG5ryZxuC66T0" KEY)
       (credits-buy-button 300 30 0 "sku_HGGukwhf6cCXLr" KEY)
       (credits-buy-button 500 50 0 "sku_HGGu5QuiJLNiv9" KEY)
       (credits-buy-button 900 100 0 "sku_HGGu7oGSW24xaK" KEY)
       (credits-buy-button 1600 200 0 "sku_HGGvlCivK22DBv" KEY)
       ) 
     ]
    [(eq? type 'subscription)
     (list
      (credits-subscription-buy-button 65 5 0 "plan_H1fnr6YP21Y5N8" KEY)
      (credits-subscription-buy-button 110 10 0 "plan_HGH4uigniHjTFZ" KEY)  
      (credits-subscription-buy-button 220 20 0 "plan_HGH573ZtogyiO9" KEY)  
      (credits-subscription-buy-button 270 30 0 "plan_HGH5wCxvQLiBYJ" KEY)  
      (credits-subscription-buy-button 450 50 0 "plan_HGH6hxlNtNanvJ" KEY)  
      (credits-subscription-buy-button 800 100 0 "plan_HGH6XNwZH7UUX2" KEY)  
       )
     ]
    [else
      (error "Must supply one-time or subscription to credit button list")])
  )


(define (learn-more-button)
  "Learn More! Scroll down."
  )

(define (topics-section)
  (jumbotron class: "mb-0"
             (container
               (h2 class: "text-center" "What Credits Unlock" )
               (p class: "text-center" "A credit goes a long way! You don't have to decide now, but here are some of the topics you can choose from:")
               (card-columns (shuffle (map display-topic (topics))))
               )
             ))

(define (display-topic t)
  t)

(define (topic header image desc [level 'K-2nd])
  (define level-color
    (cond 
      [(eq? level 'K-2nd)
       "bg-info text-white"] 
      [(eq? level '3rd-6th)
       "bg-success text-white"] 
      [(eq? level '3rd-10th)
       "bg-warning text-white"] 
      [(eq? level '7th-10th)
       "bg-danger text-white"] 
      [(eq? level 'adult)
       "bg-dark text-white"]
      [(eq? level 'all-ages)
       "bg-light"
       ]
      [else
        "bg-secondary text-white"] 
      )
    )
  (card class: level-color 
        image
    (card-body
      (h5 header)
      desc)
    )
  )


(define (card-video-top src: path)
  (video 'autoplay: 'loop: 'muted: 'playsinline: 
         class: "card-img-top border-bottom"
         style: (properties 'object-fit: "cover"
                            'object-position: "0 0"
                            )
         (source src: (prefix/pathify path) type: "video/mp4")
         (source src: (prefix/pathify (mp4-path->webm-path path)) type: "video/webm")
         ))

(define (topics)
  (define (adventure)
    (topic "Coding for Harry Potter & Mario Fans"
           (card-video-top src: adventure-harrypotter-mp4-path)
           "Build your own adventure based Harry Potter or Mario games. Mario fans will earn special Mario game design badges, and vice versa for Harry Potter fans!"
           '3rd-10th
           ) 
    )
  (define (battle-arena)
    (topic "Coding for Marvel, Fortnite, & Star Wars Fans"
           (card-video-top src: battlearena-avengers-mp4-path)
           "Build battle arena-style games with characters from your favorite games and movies! Share the games you make with your new coding friends."
           '3rd-10th
           ) 
    )
  (define (artificial-intelligence)
    (topic "Artificial Intelligence" 
           (card-img-top src: (prefix/pathify artificial-intelligence-img-path))
           "Artificial intelligence and machine learning are two of the most misunderstood topics in computer science. We help clear up the confusion."
           '7th-10th
           ) 
    )
  (define (zoo-animals)
    (topic "Adventures in Coding and Zoo Animals" 
           (card-video-top src: healer-zoo-mp4-path)
           "Animals and computers have more in common than you might think! Learn to code by creating games and stories with animal characters."
           'K-2nd
           ) 
    )
  (define (cartoons)
    (topic "Adventures in Coding and Cartoons" 
           (card-video-top src: clicker-cartoon-mp4-path)
           "All kids like watching cartoons. Smart kids like coding their own cartoons."
           'K-2nd
           ) 
    )
  (define (farm-animals)
    (topic "Adventures in Coding and Farm Animals" 
           (card-video-top src: healer-animal-mp4-path)
           (p "A farm is a system. So is a field, so are the crops, and so are the animals. It’s " (b "never") " too early to learn Systems Thinking.")
           'K-2nd
           ) 
    )
  (define (pokemon-for-k-2)
    (topic "Adventures in Coding and Pokemon" 
           (card-video-top src: clicker-pokemon-mp4-path)
           "Pokemon fans of any age can write about their love of Pokemon. We help kids write about what they love with code!"
           'K-2nd
           ) 
    )
  (define (survival)
    (topic "Coding for Minecraft & Pokemon Fans" 
           (card-video-top src: survival-minecraft-mp4-path)
           "Learn how to build survival-style video games with other kids who love these video games!"
           '3rd-10th
           ) 
    )

  (define (dont-teach-coding)
    (topic "Don't Teach Coding: Until You Take This Class" 
           (card-img-top src: (prefix/pathify dont-teach-coding-img-path))
           "“Don’t Teach Coding” is a radical, humanities-first approach to teaching coding. It was written by the Co-Founders of Metacoders. This class for teachers is taught by them."
           'adult
           ) 
    )
  (define (metacognition)
    (topic "Metacognition" 
           (card-img-top src: (prefix/pathify metacognition-img-path))
           "This class teaches anyone with a brain how brains work. It’s the instruction manual for the brain and mind – the one scientists have been piecing together for decades."
           'all-ages
           ) 
    )
  (define (discord-bots)
    (topic "Discord Bots" 
           (card-img-top src: (prefix/pathify discord-img-path))
           "Coding your own chat bot is an advanced and powerful topic. Bots can be used for community-building, educational technology, and business logic."
           'all-ages 
           ) 
    )
  (define (programming-language-development)
    (topic "Programming Language Development" 
           (card-img-top src: (prefix/pathify racket-logo-img-path))
           "Language Oriented Programming is on the cutting edge of research and development. It also happens to be a core skillset at MetaCoders."
           '7th-10th 
           ) 
    )
  (define (web-development)
    (topic "Web Development" 
           (card-img-top src: (prefix/pathify web-development-img-path))
           "Full-stack web development is one of the most sought-after skillsets in the industry right now. Learn your frontends from your backends, your ORMs from your SQLs, your Javas from your JavaScripts."
           '7th-10th
           ) 
    )
  (define (graphic-design)
    (topic "Graphic Design with Code" 
           (card-img-top src: (prefix/pathify graphic-design-img-path))
           "Visual communication is almost always an end-goal of any end-user application. But code can only communicate as beautifully and clearly as its graphic designers can."
           '7th-10th
           ) 
    )
  (define (video-editing)
    (topic "Video Editing with Code" 
           (card-img-top src: (prefix/pathify video-editing-img-path))
           "The language of film is one that most people comprehend, but few can “speak.” Like coding, it is a skillset in short supply worldwide."
           '3rd-10th
           ) 
    )
  (define (computer-music)
    (topic "Coding for Musicians" 
           (card-img-top src: (prefix/pathify music-img-path))
           "Multiply the number of musical instruments you’ve heard of by 10,000. With the power of MIDI, anyone can play music, write it, and even create their own digital instruments."
           '7th-10th
           ) 
    )


  (list 
    (zoo-animals)
    (cartoons)
    (farm-animals)
    (pokemon-for-k-2)
    (adventure)
    (survival)
    (battle-arena)
    (dont-teach-coding)
    (metacognition)
    (discord-bots)
    (artificial-intelligence)
    (web-development)
    (graphic-design)
    (video-editing)
    (computer-music)
    (programming-language-development)
    ))


(define (club-description-section)
  (jumbotron  class: "mb-0"
              style: (properties background: "white")
              (container
                (row
                  (col-lg-6 class: "pl-lg-5"
                            (h2 "Learn Coding Today & Join our Educational Community Co-op")
                            (br)
                            @list{
                            @b{Quarantine Coding Club} is a chance for students to @b{learn coding and technology} with the guidance of @b{live instructors} while being able to @b{socialize with their peers}. Our goal is to @b{provide zero- to low-cost education} during quarantine by crafting a @b{thriving community} of educators, parents, and students.
                            @br
                            @ul{
                            @li{Students learn @b{new coding skills} every session. Educational activities change daily!}
                            @li{Average @b{1:5 teacher to student ratio} allows our Coding Coaches to engage students in @b{interactive, personalized, interdisciplinary experiences}.}
                            @li{Novel digital classroom models give students the @b{ability to choose} their educational activities, @b{significantly increasing student satisfaction}.}
                          @li{Sign up for any 1-hr session that fits your schedule using @b{Quarantine Credits}; purchase Quarantine Credits or @b{earn them for free by volunteering} your time and skills.}
                            @li{Great for coders of all skill levels. Sessions are available for @b{K-2nd}, @b{3rd-6th}, and @b{7th-Young Adult}.}
                            @li{Our goal is to @b{make learning coding fun} while we're all stuck at home.}
                            }})
                  (col-lg-6 class: "pr-lg-5"
                            (div class:"embed-responsive embed-responsive-16by9"
                                 (iframe class:"embed-responsive-item" src:"https://www.youtube.com/embed/GVzxUtfTLGE"))
                            (br)
                            (picture 
                              (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path adventures-in-coding-img-path)))
                              (source type: "image/jpeg" srcset: (prefix/pathify adventures-in-coding-img-path))
                              (img src: (prefix/pathify adventures-in-coding-img-path) 
                                   class: "img-fluid rounded d-block w-100 border border-dark"
                                   alt: "Two young girls learning how to code together on a chromebook"))
                            ))
                )
              )
  )

(define (summer-section)
  (jumbotron  class: "mb-0"
              style: (properties background: "white"
                                 )
              (container
                (h2 class: "text-center" "Summer Camps")
                (br)
                (h4 "Insanely Flexible Summer Camp Hours")
                (p "Summer camps? Full-day, half-day, 1-hr a day: your kids can be in camp whenever YOU want!")
                (p "Purchase the number of Quarantine Credits you need this summer. Each credit can be applied to 1-hr of camp:")
                (p "Do you want your child in camp 1-hr a day, M-F, for 8-weeks?")
                (credits-buy-button 400 40 0 "sku_GyG3n6kfimeXl9" KEY)
                (p "Do you want your child in camp for 3-hr a day, M-F, for 4-weeks?")
                (credits-buy-button 600 60 0 "sku_GyG3n6kfimeXl9" KEY)
                (p "Do you want your child in camp for 7-hr a day, M-F, for 1-week?")
                (credits-buy-button 350 35 0 "sku_GyG3n6kfimeXl9" KEY)
                (p "No scheduling required! Our camps will be operational from __ -__ from June __ - August __. Sending your kid to camp is as easy as following a link.")
                (p "There's no such thing as a 1-size fits all education! Other camps make you decide what topic your student will be learning months in advance! Our camp lets students choose the topic the day of, and even switch between topics throughout the day.")
                (p "Your child might start in a game design camp, but decide to switch to a web development camp 2-hours later. Our metacognitive staff is always there to help you and your child create the most personalized educational experience.")
                (p "Worried about screen time? We offer stretch breaks and social activities throughout the camp day to optimize your child's social & emotional wellbeing.")
                (p "No two children are the same. Some children prefer more time to reflect on what they are learning. Some children prefer to spend more time doing hands-on activities. Some children learn through discussion. Some children learn through teaching others. All you have to do is buy Quarantine Credits: for free, our staff will help you create an educational plan for your child this summer.")
                (h4 "Examples")
                (p "Jimmy is 11 years old. His parents are software engineers. Jimmy loves video games and wants to know how to make them. His parents want to give him the freedom to choose his favorite subjects this summer. So he is planning to spend his time in these classes (knowing he can change his mind later):")
                (ul
                  (li "2-hrs of Video Game Design")
                  (li "1-hr of Computer Science Principles")
                  (li "1-hr of Design Your Own Programming Language")
                  (li "1-hr of Computer Science History")
                  (li "1-hr Video Editing")
                  )
                (p "Susy is 8 years old. Her parents are educators and worked with the MetaCoders staff on a special education plan for Susy this summer. Susy loves music and art. This is her educational plan:")
                (ul
                  (li "1-hr of Code Your Own Music")
                  (li "1-hr of Graphic Design with Code")
                  (li "Yoga Breaks every 30 minutes")
                  )
                )
              )
  )


(define (customer-testimonial-section)
  (jumbotron id: "customer-testimonial-banner"
             style: (properties
                      text-align: "center"
                      margin-bottom: 0
                      background-position: "center"
                      background-size: "initial"
                      position: "relative")
             class: "d-flex align-items-center"
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
             (container
               (div style: (properties
                             display: "inline-block"
                             ;padding: 15
                             color: "white"
                             position: "relative"
                             z-index: "10")
                    (h2 "\"My daughter looks forward to each and every class. They keep her engaged and often she continues to experiment with the code after class is over. I would recommend to any student at all interested in technology as this is the way to get them introduced at a young age.\"")
                    (br)
                    (h4 "Veronica L.")
                    (p "MetaCoders Parent")
                    ))))

(define (volunteer-section)
  (jumbotron class: "mb-0"
             (container
               (h2 class: "text-center" "Want Free Quarantine Credits? Volunteer with Us!")
               (br)
               (p "Volunteers can earn Quarantine Credits for themselves or for their kids. Other perks of being a volunteer:"
                (ul
                  (li "Learn new skills: from coding to video editing, social media to IT, we train our volunteers every step of the way.")
                  (li "Support a non-profit in its educational mission.")
                  (li "Become a leader in one of the fastest growing online educational communities.")
                  )
                (div class: "text-center"
                     (button class: "btn btn-primary"
                             href: "https://bit.ly/metacoders-volunteer-form"
                             "Sign Up to Volunteer"
                             ))
                ))))


(define (faq-section)
  (jumbotron  class: "mb-0"
              style: (properties background: "white"
                                 )
              (container
                (h2 class: "text-center" "Frequently Asked Questions")
                (br)
                (h4 "General")
                (ol
                  (li (b "How do Quarantine Credits work?") " Each Quarantine Credit can be applied to one 1 hour online session. You can apply the credits you purchase to any of our unfilled scheduled sessions. You do not have to apply all of your purchased credits all at once. We keep track of how many credits each customer has so that you can wait to apply them until a time that is convenient for you!")
                  (li (b "I purchased Quarantine Credits! Now, how do I use them to sign up for Coding Club sessions?") " If you'd like to join our classes in May or the first half of June: After you purchase, you'll be directed to fill out a short form to send us your students' registration information and your preferred schedule. If you purchase credits during our normal business hours (Monday-Friday 9am-5pm PST), someone from our team will be notified and will email you within the hour to confirm your registration. If you do not receive this email within 2 hours, please call us at (858) 375-4097. If you purchase credits outside of our business hours (Monday-Friday 9am-5pm PST), someone from our team will email you during our next scheduled business hours to help you get enrolled in any of our unfilled sessions.") 
                  (li (b "How many sessions should I enroll my student in?") " We recommend no more than 1 session per day. Sessions within the same day will essentially be covering the same material. The material for sessions varies significantly from day-to-day.")
                  (li (b "Do I need to install anything in order to participate?") " Our online educational community is housed on the free platform Discord, which can be installed on any laptop. You can find installation and account setup instructions for Discord " (a href: "https://support.discord.com/hc/en-us/articles/360033931551-Getting-Started" "here") ". If you are using a chromebook, you can use the browser-version of Discord. During a session, Coaches may walk students through the installation of specific coding language environments necessary for that days' lesson.") 
                  (li (b "Can I still sign up for a session that starts today?") " You can sign up for any scheduled session, that is not yet full, up until 2 hours before the session begins. Please note: at this time, a customer service representative will email you after your purchase to help schedule your sessions. However, we are currently in the process of building an interface for customers to apply their credits to sessions themselves.") 
                  (li (b "What deals/coupons do you have available?") " We have bulk discount packages that are always available for purchase above. The more credits you purchase in 1 transaction, the less each credit costs.") 
                  (li (b "What equipment do I need in order to participate?") " All you need to participate in our Quarantine Coding Club is a computer, a keyboard, and an internet connection! We also ask students to bring paper and pencil to sessions as well.") 
                  (li (b "Can my 2 or more children share the credits I purchase?") " Students who live within the same household can share credits.") 
                  (li (b "If my 2 children are sharing 1 laptop, do we pay 2 Quarantine Credits per session or 1?") " Each device will require 1 Quarantine Credit. We understand parents don't always have enough devices for all their students. Clearly, two students who are sharing 1 laptop can't code at the same time, so we are treating each device as if it is one student at this time.") 
                  (li (b "Can parents sit in on the session?") " Yes! Parents observation and participation is welcome and encouraged!") 
                  (li (b "What if I don't use all my Quarantine Credits before this whole COVID-19 thing blows over?") " We will be continuing our Online Coding Club long after quarantines end. We are also happy to help transfer your remaining Quarantine Credits to in-person classes and camps that will be happening again after quarantines end. You can review our " (a href:"https://metacoders.org/terms-and-conditions.html" "Terms and Conditions") " for more details.")
                  (li (b "Do you record Quarantine Coding Club sessions?") " Yes, in order to be as transparent as possible with parents, we try to record all sessions; parents can ask us for these screen recordings whenever they'd like. Often, we will pre-emptively send screen recordings to parents so that parents can see what their children are learning inside our digital classrooms. Some screen recordings will also be used for marketing purposes. If sessions are used for marketing purposes, we will ensure that no identifying information like names or locations are shown. You can review our Video Publishing and Privacy policy in our " (a href:"https://metacoders.org/terms-and-conditions.html" "Terms and Conditions") ".")
                  )
                (h4 "Summer")
                (ol
                  (li (b "Do I really not need to schedule my Quarantine Credits in advance?") "That's right! Throughout the summer, from 9am-4pm PST, Monday-Friday, just have your student sign into our Discord server, and we will teach them coding! As students \"spend\" their Quarantine Credits, we'll send you an update if your Quarantine Credit balance is running low.") 
                  (li (b "How many Quarantine Credits should I purchase for this summer?") "You can do a quick estimate by multiplying the number of weeks x 5 days/week x hours per day x number of students. For example, if you have 1 child that you want to register for 3 hours per day for 5 weeks, you'd purchase: (5 weeks x 5 days/week x 3 hours per day x 1 student) = 75 credits.") 
                  )
                (h4 "Volunteers")
                (ol
                  (li (b "I'm interested in volunteering... what kinds of volunteer opportunities are there?") " Volunteers help in a variety of ways! Some volunteers are like traffic controllers, helping direct students to their preferred educational activities. Other volunteers help run targeted educational activities. Still other volunteers lead 5-minute stretch and exercise breaks to help get students moving! We believe volunteering should always be fun, so we'll help you find something that matches your interests.")
                  (li (b "Can I get free Quarantine Credits for my children by volunteering?") " This is the best part about being an educational co-op! By putting in your time and energy, you can get free educational opportunities for your children. Volunteers can receive 1 Quarantine Credit for every 30 minutes of volunteer time (that's 1-hr of education for kids for every 30 minutes of volunteer time.)")
                  (li (b "As a volunteer, can I gift my free Quarantine Credits to someone else?") " Absolutely! We have grandparents who volunteer and gift their credits to their grandchildren. Same with aunts and uncles for their nieces and nephews. You can also gift credits to someone outside your family.")
                  (li (b "I want to sign-up as a volunteer! What do I need to do?") " We're so excited to have you join our community! The first step is to fill out the volunteer interest form " (a href: "https://bit.ly/metacoders-volunteer-form" "here") ". After that, we'll follow-up with you over email with next steps.")
                  )
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
