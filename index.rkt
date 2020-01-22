#lang at-exp racket

(require metacoders-dot-org-lib
         racket/runtime-path
         website-js/components/gradient
         website-js/components/boids
         website-js/components/pointillism)

(provide index)

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "A Different Kind of Coding Education"
    #:tagline "Cutting-edge learning science, with grass-roots community support to prepare kids for the future."
    #:percent-height "80vh"
    #:image-path homepage-banner-path))

(define (jumbotron-code-the-meta-way)
  (jumbotron class: "text-center mb-0 bg-white"
               style: (properties 'overflow: "hidden")
      (container
                  (h1 "Code the Meta Way")
                  (br)
                  (h3 "Kids deserve the best in coding education.")
                  (br)
                  (row class: "justify-content-center"
                    (col-sm-8
                      (h6 "We teach kids coding the “meta“ way. We bring the latest scientific research to the table to make sure kids are getting the most out of our classes.")))
                  (br)
                  (responsive-row #:columns 3
                      (card class:"h-100"
                      (card-img-top class: "gradient-effect-green"
                                    src: (prefix/pathify games-svg-path)
                                    style: (properties background-color: "#00C851")) 
                      (card-body
                        (card-title "Meta Games")
                        (card-text "Our students stay motivated with badges and prizes.")))
                      (card class:"h-100"
                        (card-img-top class: "gradient-effect-yellow"
                                      src: (prefix/pathify brain-svg-path)
                                      style: (properties background-color: "#ffbb33")) 
                        (card-body
                          (card-title "Metacognition")
                          (card-text "By reflecting on how we learn, we are able to learn more efficiently.")))
                      (card class:"h-100"
                        (card-img-top class: "gradient-effect-blue"
                                      src: (prefix/pathify story-svg-path)
                                      style: (properties background-color: "#33b5e5")) 
                        (card-body
                          (card-title "Meta Stories")
                          (card-text "Stories are powerful tools for teaching values and communicating ideas."))))))
)

(define (jumbotron-it-takes-a-village)
  (jumbotron class: "text-center mb-0"
         style: (properties 'overflow: "hidden")
      (container
        (row 
          class: "align-items-center"
          (col-md-6 class: "my-2"
            (carousel class: "slide" 'data-ride:"carousel" id: "carouselExampleControls"
              (carousel-inner
                (carousel-item class: "active" 
                  (img src: (prefix/pathify takes-a-village-path) 
                  class: "img-fluid rounded d-block w-100" 'alt: "First Slide"))
                (carousel-item 'alt: "Second Slide"
                  (img src: (prefix/pathify takes-a-village-2-path) 
                  class: "img-fluid rounded d-block w-100" 'alt: "Second Slide"))
                (carousel-item 'alt: "Second Slide"
                  (img src: (prefix/pathify takes-a-village-3-path) 
                  class: "img-fluid rounded d-block w-100" 'alt: "Third Slide")))
              (a class: "carousel-control-prev" href: "#carouselExampleControls" 'role: "button" 'data-slide: "prev"
                (span class: "carousel-control-prev-icon" 'aria-hidden: "true")
                (span class: "sr-only" "Previous"))
              (a class: "carousel-control-next" href: "#carouselExampleControls" 'role: "button" 'data-slide: "next"
                (span class: "carousel-control-next-icon" 'aria-hidden: "true")
                (span class: "sr-only" "Next"))))
          (col-md-6 class: "my-2"
              (h2 "A good education takes a village.")
              (p "Coding education isn’t possible in many communities because the expertise isn’t there yet. We help train community members to bring grass-roots coding education to local kids.")
              (link-to join-our-team-path (button-primary id: "main-button" 
                                            class: "float-right"
                                            "Join Our Team")))))))

(define (jumbotron-save-the-world)
  (gradient class: "jumbotron mb-0 px-3 py-5"
    style: (properties ;background: "white"
                       )
    (container
      (row
        class: "align-items-center"
        (col-md-7
          (h2 "We’re teaching coding to save the world.")
          (p "Around the world, coders are tackling cancer, self-driving cars, and terrorism.  If we are going to save the world, we need more people coding.")
          (br)
          (b (p "Meet the people who are saving the world, one coding student at a time:")))
        (col-md-5 class: "text-center"
          (row
            (col-6 class: "my-3"
              (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Sonny"
                (img src: (prefix/pathify sonny-img-path) 
                     class: "img-fluid rounded img-link")))
            (col-6 class: "my-3"
              (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Lindsey"
                (img src: (prefix/pathify lindsey-img-path) 
                     class: "img-fluid rounded img-link"))))
          (row
            (col-6 class: "my-3"
              (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Sara"
                (img src: (prefix/pathify sara-img-path) 
                     class: "img-fluid rounded img-link")))
            (col-6 class: "my-3"
              (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Judith"
                (img src: (prefix/pathify judith-img-path) 
                     class: "img-fluid rounded img-link"))))
          (staff-modal #:id "Modal-Sonny"
                       #:path sonny-img-path
                       #:name "Sonny Najar"
                       #:position "Software Developer and Instructor at MetaCoders"
                       #:quote "Pick any object and ask, How did this get here? Odds are, its design, manufacturing, and distribution was shaped by code. We write these stories at a rate of 111 billion lines per year. MetaCoders can help you write your first line, or your millionth.")
          (staff-modal #:id "Modal-Lindsey"
                       #:path lindsey-img-path
                       #:name "Lindsey Handley, Ph.D."
                       #:position "Co-Founder & Officer"
                       #:quote "The moment we realized coding education could transform everything -- from math and sciences to history and language arts -- that was when we decided to found MetaCoders. You don't leave something broken when you know how to fix it.")
          (staff-modal #:id "Modal-Sara"
                       #:path sara-img-path
                       #:name "Sara Lucchini"
                       #:position "Software Developer and Instructor at MetaCoders"
                       #:quote "Writing code is a form of storytelling -- where the stories actually come true. That's the magic of our time. With that alone, teachers and students can rewrite education as we know it. MetaCoders paves the way.")
          (staff-modal #:id "Modal-Judith"
                       #:path judith-img-path
                       #:name "Judith Eisenberg"
                       #:position "Administrator and Instructor at MetaCoders"
                       #:quote "Put a coder in an fMRI, and what lights up? The language parts. The better the coder, the more their brains look like they are reading English while reading code. I designed MetaCoders education around this simple neuroscientific insight: learning to code is a form of language acquisition."))))))


(define (index)
  (page index-path
        (normal-content-wide #:head (list (title "MetaCoders | Coding Camps and Year-Round Classes for K-12")
                                          (index-critical-style))
                             #:defer-css #t
          (style/inline type: "text/css" 
                        (~a ".img-link:hover {
                            opacity: 0.5;
                            filter: alpha(opacity=50); /* For IE8 and earlier */}"
                            "@keyframes flow {
                              0% {
                                background-position: 0% 50%;
                              }
                              50% {
                                background-position: 100% 50%;
                              }
                              100% {
                                background-position: 0% 50%;
                              }
                            }"
                              ".gradient-effect-green:hover {background: linear-gradient(-45deg, #7fe3a8, #7fe3a8, #00C851, #00C851);
                                                    background-size: 400% 400%;
                                                    animation: flow 10s ease infinite;}"
                              ".gradient-effect-yellow:hover {background: linear-gradient(-45deg, #ffdd99, #ffdd99,#ffbb33, #ffbb33);
                                                    background-size: 400% 400%;
                                                    animation: flow 10s ease infinite;}"                           

                              ".gradient-effect-blue:hover {background: linear-gradient(-45deg, #99daf2, #99daf2, #33b5e5, #33b5e5);
                                                    background-size: 400% 400%;
                                                    animation: flow 10s ease infinite;}"))
          (jumbotron-header-section)
          (jumbotron-code-the-meta-way) 
          (jumbotron-it-takes-a-village)
          (jumbotron-save-the-world))))


(define (index-critical-style)
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

a:hover {
    color: #0056b3;
    text-decoration: underline
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

.h3,h3 {
    font-size: 1.75rem
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

.img-fluid {
    max-width: 100%;
    height: auto
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

.col-6 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 50%;
    flex: 0 0 50%;
    max-width: 50%
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
	.col-sm-8 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 66.666667%;
        flex: 0 0 66.666667%;
        max-width: 66.666667%
    }
}

@"@"media (min-width: 576px) {
	.col-sm-6 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 50%;
        flex: 0 0 50%;
        max-width: 50%
    }
	.col-sm-8 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 66.666667%;
        flex: 0 0 66.666667%;
        max-width: 66.666667%
    }
}

@"@"media (min-width: 768px) {
	    .col-md-3 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 25%;
        flex: 0 0 25%;
        max-width: 25%
    }
	.col-md-5 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 41.666667%;
        flex: 0 0 41.666667%;
        max-width: 41.666667%
    }

    .col-md-6 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 50%;
        flex: 0 0 50%;
        max-width: 50%
    }

    .col-md-7 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 58.333333%;
        flex: 0 0 58.333333%;
        max-width: 58.333333%
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

.fade {
    opacity: 0;
    transition: opacity .15s linear
}

.collapse {
    display: none
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

.navbar-brand:focus,.navbar-brand:hover {
    text-decoration: none
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

.navbar-toggler:not(:disabled):not(.disabled) {
    cursor: pointer
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

.navbar-dark .navbar-brand:focus,.navbar-dark .navbar-brand:hover {
    color: #fff
}

.navbar-dark .navbar-nav .nav-link {
    color: rgba(255,255,255,.5)
}

.navbar-dark .navbar-toggler {
    color: rgba(255,255,255,.5);
    border-color: rgba(255,255,255,.1)
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

.modal {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1050;
    display: none;
    overflow: hidden;
    outline: 0
}

.carousel {
    position: relative
}

.carousel-inner {
    position: relative;
    width: 100%;
    overflow: hidden
}

.carousel-item {
    position: relative;
    display: none;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    width: 100%;
    transition: -webkit-transform .6s ease;
    transition: transform .6s ease;
    transition: transform .6s ease,-webkit-transform .6s ease;
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
    -webkit-perspective: 1000px;
    perspective: 1000px
}

.carousel-item-next,.carousel-item-prev,.carousel-item.active {
    display: block
}

.carousel-item-next,.carousel-item-prev {
    position: absolute;
    top: 0
}

.carousel-item-next.carousel-item-left,.carousel-item-prev.carousel-item-right {
    -webkit-transform: translateX(0);
    transform: translateX(0)
}

@"@"supports ((-webkit-transform-style: preserve-3d) or (transform-style:preserve-3d)) {
    .carousel-item-next.carousel-item-left,.carousel-item-prev.carousel-item-right {
        -webkit-transform:translate3d(0,0,0);
        transform: translate3d(0,0,0)
    }
}

.active.carousel-item-right,.carousel-item-next {
    -webkit-transform: translateX(100%);
    transform: translateX(100%)
}

@"@"supports ((-webkit-transform-style: preserve-3d) or (transform-style:preserve-3d)) {
    .active.carousel-item-right,.carousel-item-next {
        -webkit-transform:translate3d(100%,0,0);
        transform: translate3d(100%,0,0)
    }
}

.active.carousel-item-left,.carousel-item-prev {
    -webkit-transform: translateX(-100%);
    transform: translateX(-100%)
}

@"@"supports ((-webkit-transform-style: preserve-3d) or (transform-style:preserve-3d)) {
    .active.carousel-item-left,.carousel-item-prev {
        -webkit-transform:translate3d(-100%,0,0);
        transform: translate3d(-100%,0,0)
    }
}

.carousel-control-next,.carousel-control-prev {
    position: absolute;
    top: 0;
    bottom: 0;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    width: 15%;
    color: #fff;
    text-align: center;
    opacity: .5
}

.carousel-control-prev {
    left: 0
}

.carousel-control-next {
    right: 0
}

.carousel-control-next-icon,.carousel-control-prev-icon {
    display: inline-block;
    width: 20px;
    height: 20px;
    background: transparent no-repeat center center;
    background-size: 100% 100%
}

.carousel-control-prev-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E")
}

.carousel-control-next-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E")
}

.bg-dark {
    background-color: #343a40!important
}

.bg-white {
    background-color: #fff!important
}

.bg-transparent {
    background-color: transparent!important
}

.rounded {
    border-radius: .25rem!important
}

.d-block {
    display: block!important
}

.d-flex {
    display: -webkit-box!important;
    display: -ms-flexbox!important;
    display: flex!important
}

.justify-content-center {
    -webkit-box-pack: center!important;
    -ms-flex-pack: center!important;
    justify-content: center!important
}

.align-items-center {
    -webkit-box-align: center!important;
    -ms-flex-align: center!important;
    align-items: center!important
}

.float-right {
    float: right!important
}

.fixed-top {
    position: fixed;
    top: 0;
    right: 0;
    left: 0;
    z-index: 1030
}

.sr-only {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    overflow: hidden;
    clip: rect(0,0,0,0);
    white-space: nowrap;
    -webkit-clip-path: inset(50%);
    clip-path: inset(50%);
    border: 0
}

.w-100 {
    width: 100%!important
}

.h-100 {
    height: 100%!important
}

.mb-0,.my-0 {
    margin-bottom: 0!important
}

.mt-2,.my-2 {
    margin-top: .5rem!important
}

.mb-2,.my-2 {
    margin-bottom: .5rem!important
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

.text-center {
    text-align: center!important
}

.text-white {
    color: #fff!important
}

/*# sourceMappingURL=bootstrap.min.css.map */
h1 {
    color: rgb($random[0 255],$random[0 255],$random[0 255]);
}

/* ==== FONT AWESOME ==== */
.fa,.fab,.fad,.fal,.far,.fas {
    -moz-osx-font-smoothing: grayscale;
    -webkit-font-smoothing: antialiased;
    display: inline-block;
    font-style: normal;
    font-variant: normal;
    text-rendering: auto;
    line-height: 1
}

.fa-2x {
    font-size: 2em
}

.fa-facebook-square:before {
    content: "\f082"
}

.fa-linkedin:before {
    content: "\f08c"
}

.fa-twitter-square:before {
    content: "\f081"
}

.sr-only {
    border: 0;
    clip: rect(0,0,0,0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px
}

.fab {
    font-family: "Font Awesome 5 Brands"
}                           
})