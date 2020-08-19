#lang at-exp racket

(provide topics)
(require (except-in metacoders-dot-org-lib script)
         (prefix-in normal: metacoders-dot-org-lib)
         website-js/components/l-system
         website-js
         )

(define (gems n) (span n " " (i class:"fas fa-gem")))

(define (topic header image desc #:card-color [color 'light] #:level [level 'K-2nd] #:credits-per-hour [cph #f] #:coming-soon [coming-soon #f])
  (define card-color
    (cond 
      [(eq? color 'primary)
       "bg-primary text-white"]
      [(eq? color 'secondary)
       "bg-secondary text-white"] 
      [(eq? color 'info)
       "bg-info text-white"] 
      [(eq? color 'success)
       "bg-success text-white"] 
      [(eq? color 'warning)
       "bg-warning text-white"] 
      [(eq? color 'danger)
       "bg-danger text-white"] 
      [(eq? color 'dark)
       "bg-dark text-white"]
      [(eq? color 'light)
       "bg-light"
       ]
      )
    )
  
  (card class: (~a "h-100 " card-color)
        image
    (card-body class: "bg-white text-dark"
      (h5 header)
      desc)
    (card-footer class: "d-flex"
      (if cph
          (p class: "mr-auto mb-0" (list (gems cph) "/hr"))
          #f)
      (if (eq? coming-soon #t)
        (p class: "mb-0"  "Coming Soon!")
        (p class: "mb-0" (list "Great for " level "!"))
        )
      )
    )
  )


(define (card-video-top src: path)
  (video 'autoplay: 'loop: 'muted: 'playsinline: 
         class: "card-img-top border-bottom"
         style: (properties 'height: "33%"
                            'object-fit: "cover"
                            'object-position: "0 0"
                            )
         (source src: (prefix/pathify path) type: "video/mp4")
         (source src: (prefix/pathify (mp4-path->webm-path path)) type: "video/webm")
         ))

(define card-img-top-style
  (properties 'height: "33%"
              'object-fit: "cover"
              'object-position: "0 0"
              ))

(define (topics)
  (define (endless-runner)
    (topic "Endless Runner Game" 
           (card-video-top src: endless-runner-mp4-path)
           "Students will use a typed coding language to code and customize a multi-staged game in the style of Temple Run and Super Mario Run. Students can theme their game with provided Mario, Harry Potter, or Star Wars assets complete with items to collect and things to avoid. Students will use an online coding editor. No installation needed."
           #:card-color 'primary
           #:level '3rd-10th
           #:coming-soon #f))

  (define (digital-art)
    (topic "Coding Digital Art" 
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify digital-art-img-path))
           "Get creative with code! Generate and manipulate shapes in the text-based language Scheme. Our Coding Coaches will introduce and build your student’s confidence with universal coding tools and terms like functions, definitions, and arguments -- all while creating fun pictures with code!  guide your children through a variety of text-based coding art projects using WeScheme."
           #:card-color 'warning
           #:level '3rd-10th
           #:coming-soon #f))
  
  (define (maze-game)
    (topic "Maze Game" 
           (card-video-top src: maze-mp4-path)
           "Students will focus on level design and game balance while using a typed coding language to create a top-down puzzle adventure! Students can theme their game using provided Minecraft or Pokemon assets or even create their own. Students will use an online coding editor. No installation needed."
           #:card-color 'primary
           #:level '3rd-10th
           #:coming-soon #f))

  (define (paper-coding)
    (topic "Coding Adventures" 
           (card-img-top class: "border-bottom" class: "border-bottom" style: card-img-top-style src: (prefix/pathify paper-coding-img-path))
           (list "Coding Adventures is designed for our youngest students. Our Coding Coaches will guide your young coder through creative drawing activities as they learn valuable computational thinking skills such as sequencing, pattern recognition, and problem solving as well as general computer knowledge!  They will gain basic coding skills while drawing on paper. " (b "M-F, 3pm-4pm PST"))
           #:card-color 'warning
           #:level 'K-2nd
           #:coming-soon #f))

  (define (learntomod)
    (topic "LearnToMod Minecraft"
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify conquering-covid-b-img-path))
           (list "Learn how to make cool, custom Minecraft mods with our instructors on Fridays.  Tech requirements for this topic include pre-purchasing " (a class: "text-warning" href: "https://www.learntomod.com" "LearnToMod") " software ($29.99) and having a Minecraft account on Windows or Mac version 1.9.")
           #:card-color 'primary
           #:level '3rd-10th))
  
  (define (scratch)
    (topic "Coding with Scratch" 
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify scratch-img-path))
           "Our Coding Coaches will guide your children through a variety of projects using the Scratch programming language."
           #:card-color 'warning
           #:level 'K-10th
           #:coming-soon #f))
  
  (define (adventure)
    (topic "Coding for Harry Potter & Mario Fans"
           (card-video-top src: adventure-harrypotter-mp4-path)
           "Build your own adventure based Harry Potter or Mario games. Mario fans will earn special Mario game design badges, and vice versa for Harry Potter fans! Tech requirements for this topic includes installing software in advance.  Information will be emailed to you."
           #:card-color 'primary
           #:level '3rd-10th
           #:coming-soon #f))

   (define (survival)
    (topic "Coding for Minecraft & Pokemon Fans" 
           (card-video-top src: survival-minecraft-mp4-path)
           "Learn how to build survival-style video games with other kids who love these video games! Tech requirements for this topic includes installing software in advance.  Information will be emailed to you."
           #:card-color 'warning
           #:level '3rd-10th
           #:coming-soon #f))
  
  (define (battle-arena)
    (topic "Coding for Marvel, Fortnite, & Star Wars Fans"
           (card-video-top src: battlearena-avengers-mp4-path)
           "Build battle arena-style games with characters from your favorite games and movies! Share the games you make with your new coding friends. Tech requirements for this topic includes installing software in advance.  Information will be emailed to you."
           #:card-color 'primary
           #:level '3rd-10th
           #:coming-soon #f))

    (define (3d-exploration)
    (topic "3D Exploration" 
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify 3d-exploration-img-path))
           "The magic of turning code into an immersive 3D world is something that only coders will ever experience. Students will learn a programming language for designing and customizing interactive worlds that they can walk (or fly!) through."
           #:card-color 'warning
           #:level '3rd-10th
           #:coming-soon #f))

  (define (python)
    (topic "Python Game Design" 
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify python-img-path))
           "Learn the basics of Python including syntax, variables, I/O (inputs and outputs), conditionals, data types, and an introduction to Object-Oriented Programming while designing and developing games!"
           #:card-color 'primary
           #:level '7th-10th
           #:coming-soon #t))

  (define (3d-orbit)
    (topic "3D Orbit" 
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify 3d-orbit-img-path))
           "The magic of exploring the universe in an immersive 3D world is something that only coders will ever experience. Students will learn a programming language for designing and customizing a star system thet the can fly through."
           #:card-color 'warning
           #:level '3rd-10th
           #:coming-soon #f))
  
  #|
  (define (adventures-in-coding)
    (topic "Adventures in Coding"
           (card-img-top src: (prefix/pathify adventures-in-coding-img-path))
           "Made with our youngest students in mind, K-2nd students in each session will code as a team with one of our expert Coding Coaches."
           #:level 'K-2nd))

  (define (zoo-animals)
    (topic "Adventures in Coding and Zoo Animals" 
           (card-video-top src: healer-zoo-mp4-path)
           "Animals and computers have more in common than you might think! Learn to code by creating games and stories with animal characters."
           #:level 'K-2nd
           #:coming-soon #t))

  (define (cartoons)
    (topic "Adventures in Coding and Cartoons" 
           (card-video-top src: clicker-cartoon-mp4-path)
           "All kids like watching cartoons. Smart kids like coding their own cartoons."
           #:level 'K-2nd
           #:coming-soon #t))

  (define (farm-animals)
    (topic "Adventures in Coding and Farm Animals" 
           (card-video-top src: healer-animal-mp4-path)
           (p "A farm is a system. So is a field, so are the crops, and so are the animals. It’s " (b "never") " too early to learn Systems Thinking.")
           #:level 'K-2nd
           #:coming-soon #t))

  (define (pokemon-for-k-2)
    (topic "Adventures in Coding and Pokemon" 
           (card-video-top src: clicker-pokemon-mp4-path)
           "Pokemon fans of any age can write about their love of Pokemon. We help kids write about what they love with code!"
           #:level 'K-2nd
           #:coming-soon #t))

  (define (web-development)
    (topic "Web Development" 
           (card-img-top src: (prefix/pathify web-development-img-path))
           "Full-stack web development is one of the most sought-after skillsets in the industry right now. Learn your frontends from your backends, your ORMs from your SQLs, your Javas from your JavaScripts."
           #:level '7th-10th
           #:coming-soon #t))
  
  (define (graphic-design)
    (topic "Graphic Design with Code" 
           (card-img-top src: (prefix/pathify graphic-design-img-path))
           "Visual communication is almost always an end-goal of any end-user application. But code can only communicate as beautifully and clearly as its graphic designers can."
           #:level '7th-10th
           #:coming-soon #t) )

  |#
  
  (list 
    (endless-runner)
    (digital-art)
    (maze-game)
    (paper-coding)
    (learntomod)    
    (scratch)
    (adventure)
    (survival)
    (battle-arena)
    (3d-exploration)
    (python)
    (3d-orbit)
    ))