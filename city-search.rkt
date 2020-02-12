#lang at-exp racket

(provide city-search
         cities)

(require metacoders-dot-org-lib
         threading
         website-js/components/gradient
         website-js/components/boids
         website-js/components/pointillism
         website-js/components/recursive-trees)
(require (only-in pict scale text filled-rectangle cc-superimpose colorize))

; --- require cities and define index
(require (prefix-in dc: metacoders-dot-org-dc-site))
(require (prefix-in reno: metacoders-dot-org-reno-site))
(require (prefix-in dallas: metacoders-dot-org-dallas-site))
(require (prefix-in temecula: metacoders-dot-org-temecula-site))
(require (prefix-in minneapolis: metacoders-dot-org-minneapolis-site))
(require (prefix-in poway: metacoders-dot-org-poway-site))
(require (prefix-in chula-vista: metacoders-dot-org-chula-vista-site))
(require (prefix-in new-orleans: metacoders-dot-org-new-orleans-site))
(require (prefix-in phoenix: metacoders-dot-org-phoenix-site))

(define (cities/dallas:index)
  (push-path 
    "cities"
    (push-path "dallas"
               (dallas:index))))

(define (cities/reno:index)
  (push-path 
    "cities"
    (push-path "reno"
               (reno:index))))

(define (cities/dc:index)
  (push-path 
    "cities"
    (push-path "dc"
               (dc:index))))

(define (cities/temecula:index)
  (push-path 
    "cities"
    (push-path "temecula"
               (temecula:index))))

(define (cities/minneapolis:index)
  (push-path 
    "cities"
    (push-path "minneapolis"
               (minneapolis:index))))

(define (cities/poway:index)
  (push-path 
    "cities"
    (push-path "poway"
               (poway:index))))

(define (cities/chula-vista:index)
  (push-path 
    "cities"
    (push-path "chula-vista"
               (chula-vista:index))))

(define (cities/new-orleans:index)
  (push-path 
    "cities"
    (push-path "new-orleans"
               (new-orleans:index))))

(define (cities/phoenix:index)
  (push-path 
    "cities"
    (push-path "phoenix"
               (phoenix:index))))

(define (cities)
  (list
   (push-path "cities" 
              (push-path "dallas" (dallas:pages)))
   (push-path "cities" 
              (push-path "reno" (reno:pages)))
   (push-path "cities" 
              (push-path "dc" (dc:pages)))
   (push-path "cities" 
              (push-path "temecula" (temecula:pages)))
   (push-path "cities" 
              (push-path "minneapolis" (minneapolis:pages)))
   (push-path "cities" 
              (push-path "poway" (poway:pages)))
   (push-path "cities" 
              (push-path "chula-vista" (chula-vista:pages)))
   (push-path "cities" 
              (push-path "phoenix" (phoenix:pages)))
   (push-path "cities" 
              (push-path "new-orleans" (new-orleans:pages)))))
; -----------------------------------

(define (index-page->banner-img index-page)
  (define c (page-content index-page))
  (get-property background-image:
                (get-attribute style:
                               (findf-element (query section)
                                              c))))

(define (bg-color-change-style id bg-url)
  ;take in webp and fallback to jpg
  (define webp-url bg-url)
  (define jpg-url (string-replace webp-url "webp" "jpg"))
  (style/inline
   (rule (~a ".no-webp #" id ".card:before") ;".card-img-top"
         (properties
            'content: "' '" 
            height: "100%"
            background-image: jpg-url
            background-position: "center"
            background-size: "cover"
            filter: "grayscale(100%)"
            'border-top-left-radius: "calc(.25rem - 1px)"
            'border-top-right-radius: "calc(.25rem - 1px)"
            ))
   (rule (~a ".webp #" id ".card:before") ;".card-img-top"
         (properties
            'content: "' '" 
            height: "100%"
            background-image: webp-url
            background-position: "center"
            background-size: "cover"
            filter: "grayscale(100%)"
            'border-top-left-radius: "calc(.25rem - 1px)"
            'border-top-right-radius: "calc(.25rem - 1px)"
            ))
   (rule (~a "#" id ".card:hover:before") ;".card-img-top:hover"
         (properties
            filter: "none"
            '-webkit-filter: "grayscale(0%)"
            ))
    ))

(define (title->id title)
  (~> title
      (string-downcase _)
      (string-replace _ "," "")
      (string-replace _ "." "")
      (string-replace _ " " "-")))

(define (index-page->city-card title alt-tag index-page)
  (a href: (pathify (add-path-prefix (page-path index-page)))
     style: (properties 'text-decoration: "none")
     (card id: (title->id title)
           class: "border-primary text-primary"
           style: (properties height: "18rem" ;300px
                              ;background-image: (index-page->banner-img index-page)
                              ;background-position: "center"
                              ;background-size: "cover"
                              )
           role: "img"
           'aria-label: alt-tag
           (bg-color-change-style (title->id title) (index-page->banner-img index-page))
           (card-footer class: "p-0 border-primary"
                        (h5 class: "m-0 p-3" title)))
    ))

(define (add-a-city-card)
  (card class: "h-100"
    (card-body
      (card-title "Your city can too!")
      (link-to partners-top-path
               (button-secondary "Learn More")))))

;Move to website
(define (rule apply-to style-string)
  (~a apply-to " {" style-string "}"))

(define (color-change-style)
  (style/inline
    (rule ".card-img-top"
         (properties
           filter: "grayscale(1)"
           ))

    (rule ".card-img-top:hover"
      (properties
        filter: "none"
        '-webkit-filter: "grayscale(0%)"
        ))
    ))


(define (invert-color-change-style)
  (style/inline
   (rule ".card:hover"
         (properties
            background-color: primary
            color: "white !important"))))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "Cities That Went Meta"
    #:tagline "MetaCoders is expanding rapidly throughout the world."
    #:percent-height "60vh"
    #:image-path world-img-path
    #:alt-tag "A map of the world with pins densely covering North America and hand pointing"))

(define (cities-section)
  (jumbotron  class: "mb-0 text-center"
              style: (properties background: "white")
              (container
               (h2 "MetaCoders is excited to bring coding education to:")
               (br)
               (responsive-row #:columns 3
                               (index-page->city-card 
                                "Chula Vista, CA"
                                "City of Chula Vista, California with mountains and colorful signs"
                                (cities/chula-vista:index))
                               (index-page->city-card 
                                "Dallas, TX"
                                "City of Dallas, Texas with a view of downtown on a cloudy day"
                                (cities/dallas:index))
                               (index-page->city-card 
                                "Minneapolis, MN"
                                "City of Minneapolis, Minnesota with a view of the downtown skyline and trees"
                                (cities/minneapolis:index))
                               (index-page->city-card 
                                "New Orleans, LA"
                                "City of New Orleans, Louisiana with busy streets and trolley"
                                (cities/new-orleans:index))
                               (index-page->city-card 
                                "Phoenix, AZ"
                                "City of Phoenix, Arizona panorama view from afar with mountains"
                                (cities/phoenix:index))
                               (index-page->city-card 
                                "Poway, CA"
                                "City of Poway, California with a view of Lake Poway and natural preserve"
                                (cities/poway:index))
                               (index-page->city-card 
                                "Reno, NV"
                                "City of Reno, Nevada with busy streets and welcome sign"
                                (cities/reno:index))
                               (index-page->city-card 
                                "Temecula, CA"
                                "City of Temecula, California on a cloudy day with view of pond"
                                (cities/temecula:index))
                               (index-page->city-card 
                                "Washington, D.C."
                                "City of Washington, D.C. with view of capital and cherry blossom trees"
                                (cities/dc:index))))))

(define (learn-more-section)
  (recursive-trees #:bg-color "#6c757d"
                   #:color-1 (~a warning 80) ;"rgba(255,193,7,0.5)"
                   #:color-2 (~a primary 80) ;"rgba(253,126,20,0.5)"
               id: "learn-more-card"
               class: "card px-3 py-5 bg-transparent mb-0 text-center"
               style: (properties 'overflow: "hidden")
  ;(jumbotron  class: "mb-0 text-center"
              (container
               (h2 "If you don't see your city listed, you can still go meta.")
               (br)
               (p "MetaCoders would love to come to your community and can do it with your help.")
               (br)
               (link-to partners-top-path 
                        (button-primary "Learn More")))))

(define (city-search)
  (page city-search-path
        (normal-content-wide #:head (list
                                      (title "Locations | Coding Summer Camps and Weekly Classes | MetaCoders")
                                      (meta name: "description" content: "MetaCoders teaches K-12 kids how to code in cities across the United States, including in California, Texas, Nevada, Minnesota, North Carolina, and Louisiana.")
                                      (critical-css)
                                      )
                             #:defer-css #t
          (include-p5-js)
          (invert-color-change-style)
          (jumbotron-header-section)
          (cities-section)
          (learn-more-section)
          )))

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

.card-footer {
    padding: .75rem 1.25rem;
    background-color: rgba(0,0,0,.03);
    border-top: 1px solid rgba(0,0,0,.125)
}

.card-footer:last-child {
    border-radius: 0 0 calc(.25rem - 1px) calc(.25rem - 1px)
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

.m-0 {
    margin: 0!important
}

.mb-0,.my-0 {
    margin-bottom: 0!important
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
