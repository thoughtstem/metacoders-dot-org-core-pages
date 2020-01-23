#lang at-exp racket

(provide learn-more)

(require website/bootstrap
         (only-in 2htdp/image circle)
         metacoders-dot-org-lib  
         racket/runtime-path
         "./learn-more/main.rkt"
         ;website-js/components/gradient
         ;website-js/components/boids
         ;website-js/components/pointillism
         website-js/components/l-system)

(define-runtime-path js "learn-more/js")


(define (six-ways-to-go-meta)
  (responsive-row #:columns 3
    (enroll-call-to-action)
    (join-our-team-call-to-action)
    (donate-call-to-action)
    (partner-call-to-action)
    (scientist-call-to-action)
    (coder-call-to-action))
    )

(define (jumbotron-header)
  (mc-jumbotron-header
    #:title "Bringing the World Together Through Coding"
    #:tagline "We prepare students for the future by making sure they are fluent in one of the most powerful languages of today: code."
    #:percent-height "80vh"
    #:image-path learn-more-banner-path))

(define (about-and-mission)
  (jumbotron style: (properties background: "white" margin-bottom: 0)
    (container
      (row
        (col-md-6 class: "pr-md-5"
          (h2 "About MetaCoders")
          (p "For the past 7 years, the founders of MetaCoders have been pioneering innovative approaches to teaching students coding. MetaCoders operated as a for-profit for several years as we honed our skills as educators and developed new technologies to better engage our students. Now, MetaCoders is teaching students nationwide!"))
        (col-md-6 class: "pl-md-5"
          (h2 "Our Mission")
          (p "MetaCoders’ mission is to prepare students for the future by not just teaching coding, but teaching students how to learn new programming languages. Programming languages come and go, so students need to be ready to learn the next language - whatever that may be! This means MetaCoders spends time teaching students about their brains and how they learn!"))))))

(define (programs-we-offer)
  (jumbotron style: (properties margin-bottom: 0)
    (container class: "text-center"
      (h2 "We Teach Coding Year-Round")
        (responsive-row #:columns 3
          (card class: "h-100"
            (card-img-top src: (prefix/pathify summer-camps-img-path))
            (card-body
              (card-title "Summer Camps")
              (card-text "Fun, flexible, reasonably-priced summer camps are a great way to spark a lifetime interest in coding!")))
          (card class: "h-100"
            (card-img-top src: (prefix/pathify weekly-classes-img-path))
            (card-body
              (card-title "Weekly Classes")
              (card-text "Weekend classes at a local university or after-school at the local rec center, weekly classes keep students engaged throughout the year.")))
          (card class: "h-100"
            (card-img-top src: (prefix/pathify in-school-img-path))
            (card-body
              (card-title "In-School Workshops")
              (card-text "Many schools aren’t teaching coding, so we help schools integrate coding into the school day!")))))))
           
(define (what-makes-us-different)
  (jumbotron style: (properties background: "white" margin-bottom: 0)
    (container
      (div class: "text-center" 
        (h2 "What Makes MetaCoders Different?"))
      (br)
      (accordion id: "accordion"
        (card
          (button id: "acc-btn-1"
                  'onclick: "toggleAccBtn1();"
                  class: "btn btn-primary p-2 text-left d-flex align-items-center collapsed" 'data-toggle: "collapse" 'data-target: "#collapseOne" 'aria-expanded: "false" 'aria-controls: "collapseOne" 
            (i id: "acc-icon-1" class: "fas fa-plus mr-2")
            @script/inline{
function toggleAccBtn1() {
  var cardDiv = document.getElementById('collapseOne');
  var buttonIcon1 = document.getElementById('acc-icon-1');
  var buttonIcon2 = document.getElementById('acc-icon-2');
  var buttonIcon3 = document.getElementById('acc-icon-3');
  if (cardDiv.classList.contains("show"))
  {
   buttonIcon1.classList = "fas fa-plus mr-2";
  }
  else if (!cardDiv.classList.contains("collapsing")){
   buttonIcon1.classList = "fas fa-minus mr-2";
   buttonIcon2.classList = "fas fa-plus mr-2";
   buttonIcon3.classList = "fas fa-plus mr-2";
  }
}}
            (h5 class: "mb-0" style: (properties display: "inline-block" white-space: "normal") "  A focus on cutting-edge research from the learning sciences.")))
        (div id: "collapseOne" class: "collapse" 'aria-labelledby: "headingOne" 'data-parent: "#accordion"
          (card-body
            (p "MetaCoders wants to bring all the recent developments in learning science research and computer science education research to students around the country. While it's very difficult for the American education system to keep up with the latest science, MetaCoders hopes to share these life-changing educational developments with our students in our classes and camps:")
            (ol
              @li{@strong{Metacognition:} The word "meta" is in our name for a reason. @u{Metacognition means thinking about your own thinking}, and science shows that a metacognitive approach to instruction can help students learn to take control of their own learning by defining learning goals and monitoring their progress in achieving them. Although this isn't a skill people are born with, it's a skill that is a major game-changer in the life of anyone trying to learn anything!}
              @li{@strong{Mindset:} Many parents might be familiar with the concepts of "growth mindset" vs. "fixed mindset" popularized by renowned researcher, Carol Dweck. Essentially, @u{students with a fixed mindset believe their intelligence is "fixed"}, so they are less likely to take risks while learning; they don't want to be seen making mistakes. @u{Students with growth mindsets understand that their intelligence isn't fixed, but grows with their own effort and perserverance.} These students are less afraid of making mistakes and are more willing to struggle through challenges and persist through hard problems. We encourage students towards growth mindsets.}
              @li{@strong{Second Language Acquisition:} Recent fMRI studies suggest that as we become more and more expert programmers, the part of our brain that comprehends English and other foreign languages also becomes better at comprehending code; when we're expert programmers, it's as if our brain does the same thing whether we're reading English prose OR computer code! @u{This suggests we should be teaching coding more like a foreign language}, and less like math or science. Although we can't have students "speak" in a programming language in classrooms, we can immerse students in code, just like we immerse students in Spanish classes. We use the decades of 2nd language acquisition research to make our students fluent in the second language of code!}
              @li{@strong{And so much more!}})))
        (card
          (button id: "acc-btn-2"
                  'onclick: "toggleAccBtn2();"
                  class: "btn btn-primary p-2 text-left d-flex align-items-center collapsed" 'data-toggle: "collapse" 'data-target: "#collapseTwo" 'aria-expanded: "false" 'aria-controls: "collapseTwo" 
            (i id: "acc-icon-2" class: "fas fa-plus mr-2")
            @script/inline{
function toggleAccBtn2() {
  var cardDiv = document.getElementById('collapseTwo');
  var buttonIcon1 = document.getElementById('acc-icon-1');
  var buttonIcon2 = document.getElementById('acc-icon-2');
  var buttonIcon3 = document.getElementById('acc-icon-3');
  if (cardDiv.classList.contains("show"))
  {
   buttonIcon2.classList = "fas fa-plus mr-2";
  }
  else if (!cardDiv.classList.contains("collapsing")){
   buttonIcon1.classList = "fas fa-plus mr-2";
   buttonIcon2.classList = "fas fa-minus mr-2";
   buttonIcon3.classList = "fas fa-plus mr-2";
  }
}}
            (h5 class: "mb-0" style: (properties display: "inline-block" white-space: "normal")"  Building communities of learning around the country.")))
        (div id: "collapseTwo" class: "collapse" 'aria-labelledby: "headingTwo" 'data-parent: "#accordion"
          (card-body
            @p{More and more computer science jobs are opening up every day, and we don't have enough programmers to fill them. @u{In 2020, there will be approximately 1 million unfilled coding jobs!} And these are good jobs with high salaries. Therefore, to meet this challenge, we're forming communities of learning across the country so that students have access to teachers and teachers have access to students. Because many communities have a shortage of coders, one of our challenges is to train teachers so that they can provide this expertise to local students. We're also providing all of our curriculum and training materials @u{for free} so that anyone can start teaching local students in their area with our help.}))
        (card
          (button id: "acc-btn-3"
                  'onclick: "toggleAccBtn3();"
                  class: "btn btn-primary p-2 text-left d-flex align-items-center collapsed" 'data-toggle: "collapse" 'data-target: "#collapseThree" 'aria-expanded: "false" 'aria-controls: "collapseThree"  
            (i id: "acc-icon-3" class: "fas fa-plus mr-2")
            @script/inline{
function toggleAccBtn3() {
  var cardDiv = document.getElementById('collapseThree');
  var buttonIcon1 = document.getElementById('acc-icon-1');
  var buttonIcon2 = document.getElementById('acc-icon-2');
  var buttonIcon3 = document.getElementById('acc-icon-3');
  if (cardDiv.classList.contains("show"))
  {
   buttonIcon3.classList = "fas fa-plus mr-2";
  }
  else if (!cardDiv.classList.contains("collapsing")){
   buttonIcon1.classList = "fas fa-plus mr-2";
   buttonIcon2.classList = "fas fa-plus mr-2";
   buttonIcon3.classList = "fas fa-minus mr-2";
  }
}}
            (h5 class: "mb-0" style: (properties display: "inline-block" white-space: "normal")  "  A non-profit worldview, but with for-profit resources.")))
        (div id: "collapseThree" class: "collapse" 'aria-labelledby: "headingOne" 'data-parent: "#accordion"
          (card-body
            @p{We've run coding classes, camps, and workshops for the past 7 years under a for-profit named ThoughtSTEM. We've worked with tens of thousands of children and learned so much about how to create classrooms that inspire and motivate students to keep learning. As a for-profit, however, we were always limited to working with students in certain areas who could afford our classes. That's why we started MetaCoders: @u{because students shouldn't be prevented from learning coding just because of their family's situation.} We are bringing quality for-profit education at a non-profit price.}))))))


(define (where-do-you-fit-in)
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
              #:line-color (~a warning 66);"rgba(255,193,7,0.4)"
              #:max-radius 0
  ;(boids #:color "#ffc107"
  ;       #:bg-color "#e9ecef"
              class: "card px-3 py-5 mb-0 bg-transparent"
              style: (properties 'overflow: "hidden")
  ;(jumbotron style: (properties margin-bottom: 0)
    (container
      (div class: "text-center"
        (h2 "Where Do You Fit In With MetaCoders?")
        (br)
        (p "If you want to help us in our mission, there’s a lot of ways you can become involved, from enrolling your student to donating to becoming an employee or volunteer! Help us change the world!")
        (br))
      (six-ways-to-go-meta))))

(define (learn-more)
  (list
    (page js/name-replace-effect.js
          (file->string (build-path js "name-replace-effect.js"))) 
    (page learn-more-path
      (normal-content-wide #:head (list ;(include-css "css/custom.css") ; THIS FILE IS BLANK?
                                        (title "Learn More | Non-Profit Computer Science Education | MetaCoders"))
        (include-p5-js)
        (jumbotron-header)
        (about-and-mission)
        (programs-we-offer)
        (what-makes-us-different)
        (where-do-you-fit-in)
        (include-js "js/name-replace-effect.js")))))
