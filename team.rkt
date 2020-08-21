#lang racket

(provide jumbotron-save-the-world)

(require metacoders-dot-org-lib
         racket/runtime-path
         website-js/components/gradient
         )

(define (jumbotron-save-the-world)
  (gradient class: "jumbotron mb-0 px-3 py-5"
    style: (properties ;background: "white"
                       )
    (container
      (row
        class: "align-items-center"
        (col-md-7
          (h2 "We’re teaching coding to save the world.")
          (p "Around the world, coders are finding a cure for cancer, engineering safer self-driving cars, and fighting the spread of COVID.  If we are going to save the world, we need more people coding.")
          (br)
          (b (p "Meet the people who are saving the world, one coding student at a time:")))
        (col-md-5 class: "text-center"
          (row
            (col-3 class: "m-1 p-1"
              (a href: "#" data-toggle: "modal" data-target: "#Modal-Stephen"
                (picture 
                 (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path stephen-img-path)))
                 (source type: "image/jpeg" srcset: (prefix/pathify stephen-img-path))
                 (img src: (prefix/pathify stephen-img-path) 
                      class: "img-fluid rounded img-link"
                      alt: "Portrait of Stephen R. Foster,the MetaCoders Co-Founder and President."))))
            (col-3 class: "m-1 p-1"
              (a href: "#" data-toggle: "modal" data-target: "#Modal-Lindsey"
                (picture 
                 (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path lindsey-img-path)))
                 (source type: "image/jpeg" srcset: (prefix/pathify lindsey-img-path))
                 (img src: (prefix/pathify lindsey-img-path) 
                     class: "img-fluid rounded img-link"
                     alt: "Portrait of Lindsey Handley, the MetaCoders Co-Founder and Vice President."))))
            (col-3 class: "m-1 p-1"
              (a href: "#" data-toggle: "modal" data-target: "#Modal-Sonny"
                (picture 
                 (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path sonny-img-path)))
                 (source type: "image/jpeg" srcset: (prefix/pathify sonny-img-path))
                 (img src: (prefix/pathify sonny-img-path) 
                     class: "img-fluid rounded img-link"
                     alt: "Portrait of Sonny Najar, Senior Operations Manager.")))))

          (row
            (col-3 class: "m-1 p-1"
              (a href: "#" data-toggle: "modal" data-target: "#Modal-Jason"
                (picture 
                 (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path jason-img-path)))
                 (source type: "image/jpeg" srcset: (prefix/pathify jason-img-path))
                 (img src: (prefix/pathify jason-img-path) 
                      class: "img-fluid rounded img-link"
                      alt: "Portrait of Jason Le, Senior Curriculum Manager."))))
            (col-3 class: "m-1 p-1"              
                   (picture 
                    (img class: "h-100 w-100 p-2 bg-white rounded" src: (prefix/pathify tall-logo-svg-path))))
            (col-3 class: "m-1 p-1"
              (a href: "#" data-toggle: "modal" data-target: "#Modal-Sara"
                (picture 
                 (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path sara-img-path)))
                 (source type: "image/jpeg" srcset: (prefix/pathify sara-img-path))
                 (img src: (prefix/pathify sara-img-path) 
                      class: "img-fluid rounded img-link"
                      alt: "Portrait of Sara Lucchini, Senior Manager of Learning & Development.")))))

          (row
            (col-3 class: "m-1 p-1"
              (a href: "#" data-toggle: "modal" data-target: "#Modal-Judith"
                (picture 
                 (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path judith-img-path)))
                 (source type: "image/jpeg" srcset: (prefix/pathify judith-img-path))
                 (img src: (prefix/pathify judith-img-path) 
                     class: "img-fluid rounded img-link"
                     alt: "Portrait of Judith Eisenberg, Senior Manager of Human Resources & Instructional Operations."))))
            (col-3 class: "m-1 p-1"
              (a href: "#" data-toggle: "modal" data-target: "#Modal-Jordan"
                (picture 
                 (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path jordan-img-path)))
                 (source type: "image/jpeg" srcset: (prefix/pathify jordan-img-path))
                 (img src: (prefix/pathify jordan-img-path) 
                      class: "img-fluid rounded img-link"
                      alt: "Portrait of Jordan Hisamoto, Senior Program Manager."))))
            (col-3 class: "m-1 p-1"
              (a href: "#" data-toggle: "modal" data-target: "#Modal-Eunice"
                (picture 
                 (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path eunice-img-path)))
                 (source type: "image/jpeg" srcset: (prefix/pathify eunice-img-path))
                 (img src: (prefix/pathify eunice-img-path) 
                     class: "img-fluid rounded img-link"
                     alt: "Portrait of Eunice Baes, Customer Service Specialist")))))
          
          (staff-modal #:id "Modal-Stephen"
                       #:path stephen-img-path
                       #:name "Stephen R. Foster, Ph.D."
                       #:position "President | Co-Founder | Officer"
                       )
          (staff-modal #:id "Modal-Lindsey"
                       #:path lindsey-img-path
                       #:name "Lindsey Handley, Ph.D."
                       #:position "Vice-President | Co-Founder | Officer"
                       ;#:quote "The moment we realized coding education could transform everything -- from math and sciences to history and language arts -- that was when we decided to found MetaCoders. You don't leave something broken when you know how to fix it."
                       )
          (staff-modal #:id "Modal-Sonny"
                       #:path sonny-img-path
                       #:name "Sonny Najar"
                       #:position "Senior Operations Manager | Software and Curriculum Developer | Head Coach"
                       ;#:quote "Pick any object and ask, How did this get here? Odds are, its design, manufacturing, and distribution was shaped by code. We write these stories at a rate of 111 billion lines per year. MetaCoders can help you write your first line, or your millionth."
                       )          
          (staff-modal #:id "Modal-Sara"
                       #:path sara-img-path
                       #:name "Sara Lucchini"
                       #:position "Senior Manager of Learning & Development | Software and Curriculum Developer | Head Coach"
                       ;#:quote "Writing code is a form of storytelling -- where the stories actually come true. That's the magic of our time. With that alone, teachers and students can rewrite education as we know it. MetaCoders paves the way."
                       )
          (staff-modal #:id "Modal-Jason"
                       #:path jason-img-path
                       #:name "Jason Le"
                       #:position "Senior Curriculum Manager | Software Developer | Game Designer | Head Coach "
                       )
          (staff-modal #:id "Modal-Judith"
                       #:path judith-img-path
                       #:name "Judith Eisenberg"
                       #:position "Senior Manager of Human Resources & Instructional Operations | Head Coach"
                       ;#:quote "Put a coder in an fMRI, and what lights up? The language parts. The better the coder, the more their brains look like they are reading English while reading code. I designed MetaCoders education around this simple neuroscientific insight: learning to code is a form of language acquisition."
                       )
          (staff-modal #:id "Modal-Jordan"
                       #:path jordan-img-path
                       #:name "Jordan Hisamoto"
                       #:position "Senior Program Manager | Senior Manager of Customer Service"
                       )
          (staff-modal #:id "Modal-Eunice"
                       #:path eunice-img-path
                       #:name "Eunice Baes"
                       #:position "Customer Service Specialist"
                       )
          )))))