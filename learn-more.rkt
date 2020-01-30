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
  (responsive-row #:columns 3 #:d-flex? #t
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
    #:image-path learn-more-banner-path
    #:alt-tag "A silly, fun summer coding camp group photo with students and teachers"))

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
        (responsive-row #:columns 3 #:d-flex? #t
          (card style: (properties 'flex: 1) ;class: "h-100"
            (picture 
                 (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path summer-camps-img-path)))
                 (source type: "image/jpeg" srcset: (prefix/pathify summer-camps-img-path))
                 (card-img-top src: (prefix/pathify summer-camps-img-path)
                               alt: "Female summer coding camp leader poses for a selfie with a happy group of young girls"))
            (card-body
              (card-title "Summer Camps")
              (card-text "Fun, flexible, reasonably-priced summer camps are a great way to spark a lifetime interest in coding!")))
          (card style: (properties 'flex: 1) ;class: "h-100"
            (picture 
                 (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path weekly-classes-img-path)))
                 (source type: "image/jpeg" srcset: (prefix/pathify weekly-classes-img-path))
                 (card-img-top src: (prefix/pathify weekly-classes-img-path)
                          alt: "Elementary school-aged boy shows off the digital artwork he made for video game"))
            (card-body
              (card-title "Weekly Classes")
              (card-text "Weekend classes at a local university or after-school at the local rec center, weekly classes keep students engaged throughout the year.")))
          (card style: (properties 'flex: 1) ;class: "h-100"
            (picture 
                 (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path in-school-img-path)))
                 (source type: "image/jpeg" srcset: (prefix/pathify in-school-img-path))
                 (card-img-top src: (prefix/pathify in-school-img-path)
                          alt: "A computer science instructor teaching engaged elementary students using white board"))
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
                                        (title "Learn More | Non-Profit Computer Science Education | MetaCoders")
                                        (meta name: "description" content: "As a nonprofit, MetaCoders’ mission is to prepare students for the future by not just teaching coding, but teaching students how to learn new programming languages. ")
                                        (critical-css)
                                        )
                           #:defer-css #t
        (include-p5-js)
        (jumbotron-header)
        (about-and-mission)
        (programs-we-offer)
        (what-makes-us-different)
        (where-do-you-fit-in)
        (include-js "js/name-replace-effect.js")))))

(define (critical-css)
  @style/inline[type: "text/css"]{
:root {
    --blue:#007bff;--indigo:#6610f2;--purple:#6f42c1;--pink:#e83e8c;--red:#dc3545;--orange:#fd7e14;--yellow:#ffc107;--green:#28a745;--teal:#20c997;--cyan:#17a2b8;--white:#fff;--gray:#6c757d;--gray-dark:#343a40;--primary:#007bff;--secondary:#6c757d;--success:#28a745;--info:#17a2b8;--warning:#ffc107;--danger:#dc3545;--light:#f8f9fa;--dark:#343a40;--breakpoint-xs:0;--breakpoint-sm:576px;--breakpoint-md:768px;--breakpoint-lg:992px;--breakpoint-xl:1200px;--font-family-sans-serif:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";--font-family-monospace:SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace}

*,::after,::before {
    box-sizing: border-box
}

html {
    font-family: sans-serif;
    line-height: 1.15;
    -webkit-text-size-adjust: 100%;
    -ms-text-size-adjust: 100%;
    -ms-overflow-style: scrollbar;
    -webkit-tap-highlight-color: transparent
}

article,aside,dialog,figcaption,figure,footer,header,hgroup,main,nav,section {
    display: block
}

body {
    margin: 0;
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    text-align: left;
    background-color: #fff
}

h1,h2,h3,h4,h5,h6 {
    margin-top: 0;
    margin-bottom: .5rem
}

p {
    margin-top: 0;
    margin-bottom: 1rem
}

dl,ol,ul {
    margin-top: 0;
    margin-bottom: 1rem
}

b,strong {
    font-weight: bolder
}

small {
    font-size: 80%
}

a {
    color: #007bff;
    text-decoration: none;
    background-color: transparent;
    -webkit-text-decoration-skip: objects
}

img {
    vertical-align: middle;
    border-style: none
}

button {
    border-radius: 0
}

button,input,optgroup,select,textarea {
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit
}

button,input {
    overflow: visible
}

button,select {
    text-transform: none
}

[type=reset],[type=submit],button,html [type=button] {
    -webkit-appearance: button
}

.h1,.h2,.h3,.h4,.h5,.h6,h1,h2,h3,h4,h5,h6 {
    margin-bottom: .5rem;
    font-family: inherit;
    font-weight: 500;
    line-height: 1.2;
    color: inherit
}

.h1,h1 {
    font-size: 2.5rem
}

.h2,h2 {
    font-size: 2rem
}

.h5,h5 {
    font-size: 1.25rem
}

.h6,h6 {
    font-size: 1rem
}

.small,small {
    font-size: 80%;
    font-weight: 400
}

.list-unstyled {
    padding-left: 0;
    list-style: none
}

.container {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto
}

@"@"media (min-width: 576px) {
    .container {
        max-width:540px
    }
}

@"@"media (min-width: 768px) {
    .container {
        max-width:720px
    }
}

@"@"media (min-width: 992px) {
    .container {
        max-width:960px
    }
}

@"@"media (min-width: 1200px) {
    .container {
        max-width:1140px
    }
}

.row {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px
}

.col,.col-1,.col-10,.col-11,.col-12,.col-2,.col-3,.col-4,.col-5,.col-6,.col-7,.col-8,.col-9,.col-auto,.col-lg,.col-lg-1,.col-lg-10,.col-lg-11,.col-lg-12,.col-lg-2,.col-lg-3,.col-lg-4,.col-lg-5,.col-lg-6,.col-lg-7,.col-lg-8,.col-lg-9,.col-lg-auto,.col-md,.col-md-1,.col-md-10,.col-md-11,.col-md-12,.col-md-2,.col-md-3,.col-md-4,.col-md-5,.col-md-6,.col-md-7,.col-md-8,.col-md-9,.col-md-auto,.col-sm,.col-sm-1,.col-sm-10,.col-sm-11,.col-sm-12,.col-sm-2,.col-sm-3,.col-sm-4,.col-sm-5,.col-sm-6,.col-sm-7,.col-sm-8,.col-sm-9,.col-sm-auto,.col-xl,.col-xl-1,.col-xl-10,.col-xl-11,.col-xl-12,.col-xl-2,.col-xl-3,.col-xl-4,.col-xl-5,.col-xl-6,.col-xl-7,.col-xl-8,.col-xl-9,.col-xl-auto {
    position: relative;
    width: 100%;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px
}

.col-12 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 100%;
    flex: 0 0 100%;
    max-width: 100%
}

@"@"media (min-width: 576px) {
    .col-sm-6 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 50%;
        flex: 0 0 50%;
        max-width: 50%
    }
}

@"@"media (min-width: 768px) {
	.col-md-3 {
		-webkit-box-flex: 0;
		-ms-flex: 0 0 25%;
		flex: 0 0 25%;
		max-width: 25%
	}
	.col-md-6 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 50%;
        flex: 0 0 50%;
        max-width: 50%
    }
}

@"@"media (min-width: 992px) {
	.col-lg-4 {
		-webkit-box-flex: 0;
		-ms-flex: 0 0 33.333333%;
		flex: 0 0 33.333333%;
		max-width: 33.333333%
    }
}

.btn {
    display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out
}

.btn:not(:disabled):not(.disabled) {
    cursor: pointer
}

.btn-primary {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff
}

.btn-block {
    display: block;
    width: 100%
}

.collapse {
    display: none
}

.nav-link {
    display: block;
    padding: .5rem 1rem
}

.navbar {
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding: .5rem 1rem
}

.navbar-brand {
    display: inline-block;
    padding-top: .3125rem;
    padding-bottom: .3125rem;
    margin-right: 1rem;
    font-size: 1.25rem;
    line-height: inherit;
    white-space: nowrap
}

.navbar-nav {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    padding-left: 0;
    margin-bottom: 0;
    list-style: none
}

.navbar-nav .nav-link {
    padding-right: 0;
    padding-left: 0
}

.navbar-collapse {
    -ms-flex-preferred-size: 100%;
    flex-basis: 100%;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center
}

.navbar-toggler {
    padding: .25rem .75rem;
    font-size: 1.25rem;
    line-height: 1;
    background-color: transparent;
    border: 1px solid transparent;
    border-radius: .25rem
}

.navbar-toggler:focus,.navbar-toggler:hover {
    text-decoration: none
}

.navbar-toggler:not(:disabled):not(.disabled) {
    cursor: pointer
}

.navbar-toggler-icon {
    display: inline-block;
    width: 1.5em;
    height: 1.5em;
    vertical-align: middle;
    content: "";
    background: no-repeat center center;
    background-size: 100% 100%
}

@"@"media (min-width: 768px) {
    .navbar-expand-md {
        -webkit-box-orient:horizontal;
        -webkit-box-direction: normal;
        -ms-flex-flow: row nowrap;
        flex-flow: row nowrap;
        -webkit-box-pack: start;
        -ms-flex-pack: start;
        justify-content: flex-start
    }

    .navbar-expand-md .navbar-nav {
        -webkit-box-orient: horizontal;
        -webkit-box-direction: normal;
        -ms-flex-direction: row;
        flex-direction: row
    }
	
	.navbar-expand-md .navbar-nav .nav-link {
        padding-right: .5rem;
        padding-left: .5rem
    }

	.navbar-expand-md .navbar-collapse {
        display: -webkit-box!important;
        display: -ms-flexbox!important;
        display: flex!important;
        -ms-flex-preferred-size: auto;
        flex-basis: auto
    }

    .navbar-expand-md .navbar-toggler {
        display: none
    }
}

.navbar-dark .navbar-brand {
    color: #fff
}

.navbar-dark .navbar-nav .nav-link {
    color: rgba(255,255,255,.5)
}

.navbar-dark .navbar-toggler {
    color: rgba(255,255,255,.5);
    border-color: rgba(255,255,255,.1)
}

.navbar-dark .navbar-toggler-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255, 255, 255, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E")
}

.card {
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: .25rem
}

.card-body {
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem
}

.card-title {
    margin-bottom: .75rem
}

.card-text:last-child {
    margin-bottom: 0
}

.card-header {
    padding: .75rem 1.25rem;
    margin-bottom: 0;
    background-color: rgba(0,0,0,.03);
    border-bottom: 1px solid rgba(0,0,0,.125)
}

.card-header:first-child {
    border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0
}


.card-footer {
    padding: .75rem 1.25rem;
    background-color: rgba(0,0,0,.03);
    border-top: 1px solid rgba(0,0,0,.125)
}

.card-footer:last-child {
    border-radius: 0 0 calc(.25rem - 1px) calc(.25rem - 1px)
}

.card-img-top {
    width: 100%;
    border-top-left-radius: calc(.25rem - 1px);
    border-top-right-radius: calc(.25rem - 1px)
}

.jumbotron {
    padding: 2rem 1rem;
    margin-bottom: 2rem;
    background-color: #e9ecef;
    border-radius: .3rem
}

@"@"media (min-width: 576px) {
    .jumbotron {
        padding:4rem 2rem
    }
}

.bg-dark {
    background-color: #343a40!important
}

.bg-transparent {
    background-color: transparent!important
}

.border-primary {
    border-color: #007bff!important
}

.d-flex {
    display: -webkit-box!important;
    display: -ms-flexbox!important;
    display: flex!important
}

.align-items-center {
    -webkit-box-align: center!important;
    -ms-flex-align: center!important;
    align-items: center!important
}

.fixed-top {
    position: fixed;
    top: 0;
    right: 0;
    left: 0;
    z-index: 1030
}

.h-100 {
    height: 100%!important
}

.m-0 {
    margin: 0!important
}

.mb-0,.my-0 {
    margin-bottom: 0!important
}

.mr-2,.mx-2 {
    margin-right: .5rem!important
}

.mt-3,.my-3 {
    margin-top: 1rem!important
}

.mr-3,.mx-3 {
    margin-right: 1rem!important
}

.mb-3,.my-3 {
    margin-bottom: 1rem!important
}

.p-0 {
    padding: 0!important
}

.p-2 {
    padding: .5rem!important
}

.p-3 {
    padding: 1rem!important
}

.pr-3,.px-3 {
    padding-right: 1rem!important
}

.pl-3,.px-3 {
    padding-left: 1rem!important
}

.pt-4,.py-4 {
    padding-top: 1.5rem!important
}

.pt-5,.py-5 {
    padding-top: 3rem!important
}

.pb-5,.py-5 {
    padding-bottom: 3rem!important
}
	
.ml-auto,.mx-auto {
    margin-left: auto!important
}

@"@"media (min-width: 768px) {
    .pr-md-5,.px-md-5 {
        padding-right: 3rem!important
    }
	.pl-md-5,.px-md-5 {
        padding-left: 3rem!important
    }
}

.text-left {
    text-align: left!important
}

.text-center {
    text-align: center!important
}

.text-white {
    color: #fff!important
}

.text-primary {
    color: #007bff!important
}

/*# sourceMappingURL=bootstrap.min.css.map */
h1 {
    color: rgb($random[0 255],$random[0 255],$random[0 255]);
}

})