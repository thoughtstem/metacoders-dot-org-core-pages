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


(define (online)
  (page online-top-path
        (normal-content-wide
          #:head (list (title "Quarantine Coding Club from MetaCoders")
                       (meta name: "description" content: "Online coding club for kids and young adults that teaches coding through interdisplinary topics.")
                       (common-critical-css)
                       (link 'rel: "preconnect" href:"https://q.stripe.com")
                       (link 'rel: "preconnect" href:"https://m.stripe.com")
                       (normal:script src:"https://js.stripe.com/v3")
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
    #:tagline "Learn Coding in Context from Live Instructors in our Digital Classrooms while we're all in Quarantine!"
    #:percent-height "60vh"
    #:image-path online-banner-path
    #:alt-tag "Young boy coding a video game on his laptop while he's in quarantine during the COVID-19 pandemic."))

(define (club-description-section)
  (jumbotron  class: "mb-0"
              style: (properties background: "white")
              (container
                (row
                  (col-lg-6 class: "pl-lg-5"
                            (h2 "Learn Coding Today, and Be a Part of the Solution to COVID-19!")
                            (br)
                            @list{
                            @b{Quarantine Coding Club} is a chance to explore coding in the context of COVID-19 with the guidance of @b{skilled instructors} that can provide @b{real-time} feedback. Our goal is to @b{empower} students to build their own digital solutions to @b{solve problems} they might see in their households and neighborhoods.
                            @br
                            @ul{
                            @li{Join us and learn @b{new coding skills } every weekday. Our flexible curriculum allows you to join on the days that work best for you.}
                            @li{With a @b{1:5 teacher to student ratio}, our expert Coding Coaches deliver @b{interactive, personalized, interdisciplinary experiences} to students while we all shelter-in-place together.}
                            @li{Using @b{Quarantine Credits}, sign up for any 1-hr session that fits your schedule; there will be @b{different skills and topics covered each day}.}
                            @li{Our Quarantine Coding Club is great for coders of all skill levels. Sessions are available for @b{K-2nd}, @b{3rd-6th}, and @b{7th-Young Adult}.}
                            @li{Our goal is to @b{make learning coding fun} while we're all stuck at home.}
                            }})
                  (col-lg-6 class: "pr-lg-5"
                            (div class:"embed-responsive embed-responsive-16by9"
                                 (iframe class:"embed-responsive-item" src:"https://www.youtube.com/embed/GVzxUtfTLGE"))
                            (br)
                            (picture 
                              (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path coding-club-img-path)))
                              (source type: "image/jpeg" srcset: (prefix/pathify coding-club-img-path))
                              (img src: (prefix/pathify coding-club-img-path) 
                                   class: "img-fluid rounded d-block w-100 border border-dark"
                                   alt: "Screenshot of a Quarantine Coding Club session in action with a Coding Coach and students coding in Racket"))
                            ))
                )
              )
  )

(define (subject-description-section)
  (jumbotron  class: "mb-0"
              (container
                (h2 class: "text-center" "Coding Club Subjects Currently Available")
                (br)
                (row
                  (col-lg-4 class: "pr-lg-5"
                            (picture 
                              (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path adventures-in-coding-img-path)))
                              (source type: "image/jpeg" srcset: (prefix/pathify adventures-in-coding-img-path))
                              (img src: (prefix/pathify adventures-in-coding-img-path) 
                                   class: "img-fluid rounded d-block w-100"
                                   alt: "Two young girls learning how to code together in quarantine coding club")) 
                            )
                  (col-lg-8 class: "pr-lg-5"
                            (br)
                            (h4 "Adventures in Coding: "
                                (b class:"text-success" "K-2nd"))
                            (p "Made for our youngest students in mind, children in each session will "
                               (b "code as a team")
                               " with one of our expert Coding Coaches and learn new "
                               (b "coding concepts")
                               " each day. Everyday, there will be a new theme so that students are learning coding in context of subjects like video game design, math, and science. This subject is a fun way for "
                               (b class:"text-success" "Kindergarteners through 2nd graders")
                               " to start mastering technology while stuck in quarantine.")))


                (br)
                (row
                  (col-lg-8 class: "pr-lg-5"
                            (br)
                            (h4 "Conquer COVID with Coding (Session A): "
                                (b class: "text-primary" "3rd-6th"))
                            (p "The first in our Coding in Context series: Each session will teach "
                               (b "coding skills and concepts")
                               " to investigate the virus and it's repercussions in our society. We believe "
                               (b "understanding is the antithesis of fear; ")
                               "our Coding Coaches work with students to "
                               (b "code graphs")
                               ", showing how they can prevent the spread of COVID-19 by staying home with their families, or "
                               (b "maps")
                               " that show where coronavirus lives right now. "
                               (b "Learn coding,")
                               " while developing a better understanding of how you can be a part of the solution!"
                                " Each day, our Coding Coaches will educate students in a "
                                (b class: "text-primary" "kid-friendly")
                                " way about current events through coding."
                               )                                
                            )                               
                  (col-lg-4 class: "pl-lg-5"
                            (picture 
                              (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path conquering-covid-img-path)))
                              (source type: "image/jpeg" srcset: (prefix/pathify conquering-covid-img-path))
                              (img src: (prefix/pathify conquering-covid-img-path) 
                                   class: "img-fluid rounded d-block w-100"
                                   alt: "Kid conquering COVID-19 at home by learning coding in quarantine coding club")) 
                            )
                  )
                (br)
                (row
                  (col-lg-4 class: "pr-lg-5"
                            (picture 
                              (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path conquering-covid-b-img-path)))
                              (source type: "image/jpeg" srcset: (prefix/pathify conquering-covid-b-img-path))
                              (img src: (prefix/pathify adventures-in-coding-img-path) 
                                   class: "img-fluid rounded d-block w-100"
                                   alt: "Teenage boy learning coding at camp and programming alongside instructor")) 
                            )
                  (col-lg-8 class: "pr-lg-5"
                            (br)
                            (h4 "Conquer COVID with Coding (Session B): "
                                (b class:"text-warning" "7th-Young Adult"))
                            (p "In each session, students will learn coding skills and concepts while investigating the virus and it's repercussions in our society. Every day our Coding Coaches will have new coding projects for students that introduce "
                               (b "new programming languages")
                               ", "
                               (b "new concepts")
                               ", and "
                               (b "new challenges")
                               ". Learn coding, while developing a better understanding of how you can be a part of the solution! The content of this course is similar to Session A, but we'll move through that content at a faster pace intended for older students (like  "
                               (b class:"text-warning" "teens or young adults")
                               ")."
                               )))
                (br)
                (h4 style: (properties text-align: "center") "More Subjects are coming soon!")
                )
              )
  )

(define (schedule-section)
  (local-require website-js/components/calendar
                 gregor)
  (jumbotron  class: "mb-0"
              style: (properties background: "white"
                                 )
              (container
                (h2 class: "text-center" "Schedule")
                (br)
                (h4 "See Which Sessions Fit Your Schedule")
                (p "All Quarantine Coding Club Sessions are 1-hr long with start times listed in the calendar below. This schedule is updated on a daily basis, but some sessions may fill before we are able to update the calendar. We are currently working on making this calendar dynamic so that you can see sessions that have filled in real-time.")
                (calendar (date 2020 04)
                          (hash
                            6 (list (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B"))
                            7 (list (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B"))
                            8 (list (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B"))
                            9 (list (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B"))
                            10 (list (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B"))
                            13 (list (timeslot-chip-a "1/1/2020 8:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 8:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A") 
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures"))
                            14 (list (timeslot-chip-a "1/1/2020 8:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 8:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A") 
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures"))
                            15 (list (timeslot-chip-a "1/1/2020 8:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 8:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            16 (list (timeslot-chip-a "1/1/2020 8:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 8:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            17 (list (timeslot-chip-a "1/1/2020 8:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 8:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            20 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B")
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            21 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            22 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            23 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B")
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            24 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            27 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            28 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            29 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            30 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            )
                          ) 

                (br)

                (calendar (date 2020 05)
                          (hash
                            1 (list 
                                    (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                    (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                    (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                    (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            4 (list 
                                    (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                    (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                    (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                    (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            5 (list 
                                    (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                    (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                    (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                    (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            6 (list 
                                    (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                    (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                    (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                    (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            7 (list 
                                    (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                    (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                    (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                    (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            8 (list 
                                    (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                    (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                    (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                    (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                    (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            11 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            12 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            13 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            14 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            15 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            18 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures"))  
                            19 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            20 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            21 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            22 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            25 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            26 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            27 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            28 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            29 (list 
                                     (timeslot-chip-c "1/1/2020 8:00 PM UTC" "Adventures")
                                     (timeslot-chip-a "1/1/2020 10:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 10:00 PM UTC" "COVID B") 
                                     (timeslot-chip-a "1/1/2020 11:00 PM UTC" "COVID A")
                                     (timeslot-chip-b "1/1/2020 11:00 PM UTC" "COVID B")
                                     (timeslot-chip-c "1/1/2020 11:00 PM UTC" "Adventures")) 
                            )
                          )

                (br)

                (div style: (properties text-align:"center")
                     (h4 "Looking for a different time or have ideas for other topics? ")
                     (a href: "https://docs.google.com/forms/d/e/1FAIpQLSfQQIKgK4SmeRoKqTuxd-7jrix-GgdJVLHugvOhIVXFjRVJpQ/viewform" 
                        (button-primary id: "main-button" 
                                        "Suggestions Form")))
                )
              )
  )

(define (timeslot-chip-a start subject)

  (enclose
    (badge-pill-primary 
      id: (ns 'pill)
      (~a start ": " subject))

    (script ([pillId (ns 'pill)]
             [constructor (call 'construct)] 
             )
            (function (construct)
                      @js{
                      setTimeout(
                                 function() {
                                   var someDate = moment("@start").format('LT') 
                                   console.log(someDate)
                                   document.getElementById(@pillId).innerHTML = someDate + ":@subject"  
                                 }
                                 , 250)
                      }
                      ))
    ) 
  )

(define (timeslot-chip-b start subject)
  (enclose
    (badge-pill-warning style: (properties background-color: "#f37a1f"
                                           color: "#fff")
                        id: (ns 'pill)
                        (~a start ": " subject))

    (script ([pillId (ns 'pill)]
             [constructor (call 'construct)] 
             )
            (function (construct)
                      @js{
                      setTimeout(
                                 function() {
                                   var someDate = moment("@start").format('LT') 
                                   console.log(someDate)
                                   document.getElementById(@pillId).innerHTML = someDate + ":@subject"  
                                 }
                                 , 250)
                      }
                      ))
    ) 
  )

(define (timeslot-chip-c start subject)
  (enclose
    (badge-pill-success id: (ns 'pill)
                        (~a start ": " subject))

    (script ([pillId (ns 'pill)]
             [constructor (call 'construct)] 
             )
            (function (construct)
                      @js{
                      setTimeout(
                                 function() {
                                   var someDate = moment("@start").format('LT') 
                                   console.log(someDate)
                                   document.getElementById(@pillId).innerHTML = someDate + ":@subject"  
                                 }
                                 , 250)
                      }
                      ))
    )) 

(define (credits-section)
  (jumbotron  class: "mb-0"
              style: (properties text-align: "center"
                                 )
              (container
                (h2 class: "text-center" "Purchase Quarantine Credits")
                (br)
                (row class: "d-flex justify-content-center" 
                     (col-md-4
                       (credits-buy-button 15 1 0 "sku_GyG3n6kfimeXl9" KEY)
                       )
                     (col-md-4
                       (credits-buy-button 120 10 0 "sku_GyG4rL6NDcH2SX" KEY)
                       )
                     #;
                     (col-md-4
                       (credits-buy-button 200 20 0 "sku_GyG5ryZxuC66T0" KEY)
                       )

                     )
                (br)
                (row class: "d-flex justify-content-center"
                     (col-md-4
                       (credits-subscription-buy-button 65 5 0 "plan_H1fnr6YP21Y5N8" KEY)
                       )
                     (col-md-4
                       (credits-subscription-buy-button 100 10 0 "plan_H1fndb6HHFPoV2" KEY)
                       )
                     #;
                     (col-md-4
                       (credits-subscription-buy-button 180 20 0 "plan_H1fmwXnHW4kZoR" KEY)
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
                  (li (b "How do Quarantine Credits work?") " Each Quarantine Credit can be applied to one 1 hour online session. You can apply the credits you purchase to any of our unfilled scheduled sessions. You do not have to apply all of your purchased credits all at once. We keep track of how many credits each customer has so that you can wait to apply them until a time that is convenient for you!")
                  (li (b "I purchased Quarantine Credits! Now, how do I use them to sign up for Coding Club sessions?") " If you purchase credits during our normal business hours (Monday-Friday 9am-5pm PST), someone from our team will be notified and will email you within 30 minutes to collect your student's information and your preferred schedule. If you do not receive this email within 30 minutes, please call us at (858) 375-4097. If you purchase credits outside of our business hours (Monday-Friday 9am-5pm PST), someone from our team will email you during our next scheduled business hours to help you get enrolled in any of our unfilled sessions.") 
                  (li (b "How many sessions should I enroll my student in?") " We recommend no more than 1 session per day. Sessions within the same day will essentially be covering the same material. The material for sessions varies significantly from day-to-day.")
                  (li (b "Do I need to install anything in order to participate?") " Yes. Our coaches teach through the free platform Zoom, which would need to be installed on your computer. You can find installation instructions for the Zoom Client for Meetings " (a href: "https://zoom.us/download" "here") ". Depending on the session, you may also be asked to install certain coding language environments on your computer, or Coaches may walk students through this installation process during a session.") 
                  (li (b "Can I still sign up for a session that starts today?") " You can sign up for any scheduled session, that is not yet full, up until 2 hours before the session begins. Please note: at this time, a customer service representative will email you after your purchase to help schedule your sessions. However, we are currently in the process of building an interface for customers to apply their credits to sessions themselves.") 
                  (li (b "What deals/coupons do you have available?") " We have bulk discount packages that are always available for purchase above. The more credits you purchase in 1 transaction, the less each credit costs.") 
                  (li (b "Is the calendar above up-to-date?") " We are currently in the process of building a more robust interface to show customers are unfilled sessions. In the meantime, we are trying to keep the calendar above up-to-date as best we can. However, depending on how quickly spots in our sessions fill, some sessions may be full by the time we help you schedule your sessions. But not to worry: we'll work with you to make sure we can find a spot in a session that works with your schedule.") 
                  (li (b "What equipment do I need in order to participate?") " All you need to participate in our Quarantine Coding Club is a computer, a keyboard, and an internet connection! We also ask students to bring paper and pencil to sessions as well.") 
                  (li (b "Can my 2 or more children share the credits I purchase?") " Students who live within the same household can share credits.") 
                  (li (b "Can parents sit in on the session?") " Yes! Parents observation and participation is welcome and encouraged!") 
                  (li (b "What if I don't use all my Quarantine Credits before this whole COVID-19 thing blows over?") " We will be continuing our Online Coding Club long after quarantines end. We are also happy to help transfer your remaining Quarantine Credits to in-person classes and camps that will be happening again after quarantines end. You can review our " (a href:"https://metacoders.org/terms-and-conditions.html" "Terms and Conditions") " for more details.") 
                  )
                )
              ))


(define (credits-buy-button price num discount sku key #:suffix [suffix ""])
  (list (button-primary id:(~a "checkout-button-" sku)
                        class: "mt-md-0 mt-2 col-sm-12"
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
                          class: "mt-md-0 mt-2 col-sm-12" 
                          style: (properties border-radius: "0 0 0.18rem 0"
                                             white-space: "normal")
                          (if (> discount 0)
                            (list "Monthly Subscription:" num " Credits for "
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
