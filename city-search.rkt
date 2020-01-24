#lang racket

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
              (push-path "new-orleans" (new-orleans:pages)))))
; -----------------------------------

(define (index-page->banner-img index-page)
  (define c (page-content index-page))
  (get-property background-image:
                (get-attribute style:
                               (findf-element (query section)
                                              c))))

(define (bg-color-change-style id bg-url)
  (style/inline
   (rule (~a "#" id ".card:before") ;".card-img-top"
         (properties
            'content: "' '" 
            height: "100%"
            background-image: bg-url
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

(define (index-page->city-card title index-page)
  (a href: (pathify (add-path-prefix (page-path index-page)))
     style: (properties 'text-decoration: "none")
     (card id: (title->id title)
           class: "border-primary text-primary"
           style: (properties height: "18rem" ;300px
                              ;background-image: (index-page->banner-img index-page)
                              ;background-position: "center"
                              ;background-size: "cover"
                              )
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
    #:image-path world-img-path))

(define (cities-section)
  (jumbotron  class: "mb-0 text-center"
              style: (properties background: "white")
              (container
               (h2 "MetaCoders is excited to bring coding education to:")
               (br)
               (responsive-row #:columns 3
                               (index-page->city-card 
                                "Chula Vista, CA"
                                (cities/chula-vista:index))
                               (index-page->city-card 
                                "Dallas, TX"
                                (cities/dallas:index))
                               (index-page->city-card 
                                "Minneapolis, MN"
                                (cities/minneapolis:index))
                               (index-page->city-card 
                                "New Orleans, LA"
                                (cities/new-orleans:index))
                               (index-page->city-card 
                                "Poway, CA"
                                (cities/poway:index))
                               (index-page->city-card 
                                "Reno, NV"
                                (cities/reno:index))
                               (index-page->city-card 
                                "Temecula, CA"
                                (cities/temecula:index))
                               (index-page->city-card 
                                "Washington, D.C."
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
                                      (meta name: "description" content: "MetaCoders teaches K-12 kids how to code in cities across the United States, including in California, Texas, Nevada, Minnesota, North Carolina, and Louisiana."))
          (include-p5-js)
          (invert-color-change-style)
          (jumbotron-header-section)
          (cities-section)
          (learn-more-section)
          )))

