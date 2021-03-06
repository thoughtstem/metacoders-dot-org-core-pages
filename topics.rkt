#lang at-exp racket

(provide noinstall-topics
         install-topics
 )

(require (except-in metacoders-dot-org-lib script)
         (prefix-in normal: metacoders-dot-org-lib)
         website-js
         )

(define (gems n) (span n " " (i class:"fas fa-gem")))

(define (topic header
               image
               desc
               #:schedule [schedule #f]
               #:card-color [color 'light]
               #:level [level 'K-2nd]
               #:credits-per-hour [cph #f]
               #:coming-soon [coming-soon #f])
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
  
  (card class: card-color
        style: (properties 'flex: 1)
        image
        (card-body class: "bg-white text-dark d-flex flex-column align-content-start pb-3"
                   (h5 class: "card-title" header)
                   (div class: "mb-2"
                        desc)
                   (if schedule
                       (div class: "mt-auto" (b "Schedule: " ) schedule)
                       "")
                   )
        (card-footer class: "py-2"
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

(define (topics #:show-time? [show-time? #f])

  (define (python)
    (topic "Python Game Design" 
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify python-img-path))
           "Did you know that the Python language is named, not for the snake, but for the classics of British comedy: Monty Python? Our Coding Coaches guide students as they learn the basics of Python including syntax, variables, inputs/outputs, conditionals, and data types while designing and developing games."
           #:schedule (and show-time?
                           "MWF 2-3pm & TTh 4-5pm")
           #:card-color 'warning
           #:level '3rd-10th
           #:coming-soon #f))
  
  (define (web-design)
    (topic "Web Design & Development" 
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify web-development-img-path))
           "Create websites using a combination of HTML and CSS! Students will learn about the different tags in HTML by formatting their text, adding images and links to their websites. They will also focus on adding different styles, layouts, colors, and fonts to their website using CSS."
           #:schedule (and show-time?
                           "MWF 2-3pm & TTh 4-5pm")
           #:card-color 'primary
           #:level '3rd-10th
           #:coming-soon #f))

  (define (virtual-engineering)
    (topic "Coding & Electronics" 
           (card-video-top src: cpx-makecode-mp4-path)
           "Learn about electronics and coding without a physical board! Using a web-based code editor for physical computing, students will be able to program the buttons, lights, and sensors of a virtual Circuit Playground Express (CPX) board. Students can use the drag and drop block-based interface or jump into Javascript."
           #:schedule (and show-time?
                           "M-F 4-5pm")
           #:card-color 'warning
           #:level '3rd-10th
           #:coming-soon #f))

  (define (scratch)
    (topic "Coding with Scratch" 
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify scratch-img-path))
           "Scratch is a drag-and-drop programming language known for its beginner-friendly interface and colorful code blocks but MetaCoders takes Scratch beyond beginner! Perfect for all levels, students get to choose and code the projects that excite them from our ever-growing collection of curriculum."
           #:schedule (and show-time?
                           "M-Th 2-5pm & F 3-4pm")
           #:card-color 'primary
           #:level '3rd-10th
           #:coming-soon #f))
  
  (define (endless-runner)
    (topic "Endless Runner Game" 
           (card-video-top src: endless-runner-mp4-path)
           "Code a classic! Students use a typed coding language to code and customize a multi-staged game in the style of Temple Run and Super Mario Run. Students can theme their game with provided Mario, Harry Potter, or Star Wars assets complete with items to collect and dangers to avoid."
           #:schedule (and show-time?
                           "MWF 2-5pm & TTh 2-4pm")
           #:card-color 'warning
           #:level '3rd-10th
           #:coming-soon #f))

  (define (maze-game)
    (topic "Maze Game" 
           (card-video-top src: maze-mp4-path)
           "Code thrilling and challenging maze puzzle games! Students will focus on level design and game balance while using a typed coding language to create a top-down puzzle adventure. Students can theme their game using provided Minecraft or Pokemon assets or even create their own."
           #:schedule (and show-time?
                           "MWF 2-5pm & TTh 2-4pm")
           #:card-color 'primary
           #:level '3rd-10th
           #:coming-soon #f))
  
  (define (digital-art)
    (topic "Coding Digital Art" 
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify digital-art-img-path))
           "Get creative with code! Generate and manipulate shapes in the text-based language Scheme while learning universal coding tools like functions, definitions, and arguments. Once they have gotten comfortable the basics, students get to choose art projects from our ever-growing collection of curriculum."
           #:schedule (and show-time?
                           "MWF 2-5pm & TTh 2-4pm")
           #:card-color 'warning
           #:level '3rd-10th
           #:coming-soon #f))
  
  (define (coding-adventures)
    (topic "Coding Adventures" 
           (card-img-top class: "border-bottom" class: "border-bottom" style: card-img-top-style src: (prefix/pathify paper-coding-img-path))
           "Our Coding Coaches will guide your young coder through creative drawing and coding activities as they learn valuable computational thinking skills such as sequencing, pattern recognition, and problem solving as well as general computer knowledge!"
           #:schedule (and show-time?
                           (list "Only offered through Outschool. Click " (a class: "text-warning" href: "https://outschool.com/classes/coding-adventures-in-scratch-4-week-course-CsQ1WBCi#usFYao0EkN" "here") " to see our 4-week course, or " (a class: "text-warning" href: "https://outschool.com/classes/coding-adventures-in-scratch-LtgbLGSC#usFYao0EkN" "here")" for our single sessions."))
           #:card-color 'primary
           #:level 'K-2nd
           #:coming-soon #f))

  
  (define (adventure)
    (topic "Coding for Harry Potter & Mario Fans"
           (card-video-top src: adventure-harrypotter-mp4-path)
           "Build your own adventure based Harry Potter or Mario games. Gamer fans will earn special Mario game design badges while Harry Potter fanatics earn themed badges as they explore the \"magic\" of coding!"
           #:schedule (and show-time?
                           "MWF 3-5pm & TTh 2-4pm")
           #:card-color 'primary
           #:level '3rd-10th
           #:coming-soon #f))

  (define (survival)
    (topic "Coding for Minecraft & Pokemon Fans" 
           (card-video-top src: survival-minecraft-mp4-path)
           "Minecraft is a famous example of the classic survival-style video game. Learn how to build your own survival game inspired by Minecraft or Pokemon with other kids who love these video games!"
           #:schedule (and show-time?
                           "MWF 3-5pm & TTh 2-4pm")
           #:card-color 'warning
           #:level '3rd-10th
           #:coming-soon #f))
  
  (define (battle-arena)
    (topic "Coding for Marvel, Fortnite, & Star Wars Fans"
           (card-video-top src: battlearena-avengers-mp4-path)
           "Code your own battle game where you decide the challenge! How many enemies do you want to face? What tools fill your armory? What powerups are at your disposal? Fill your game with characters from your favorite games and movies!"
           #:schedule (and show-time?
                           "MWF 3-5pm & TTh 2-4pm")
           #:card-color 'primary
           #:level '3rd-10th
           #:coming-soon #f))

  (define (3d-exploration)
    (topic "3D Exploration" 
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify 3d-exploration-img-path))
           "Let your imagination run wild; code immersive 3D worlds you can see with a click of a button! Our Coding Coaches guide students as they learn a programming language for designing and customizing interactive worlds that they can walk (or fly!) through."
           #:schedule (and show-time?
                           "MWF 3-5pm & TTh 2-4pm")
           #:card-color 'warning
           #:level '3rd-10th
           #:coming-soon #f))

  (define (3d-orbit)
    (topic "3D Orbit" 
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify 3d-orbit-img-path))
           "Take to the stars! Code planets, moons, asteroids, stars as you create your own unique solar system in stunning 3D. Our Coding Coaches guide students as they explore a programming language for generating entire universes."
           #:schedule (and show-time?
                           "MWF 3-5pm & TTh 2-4pm")
           #:card-color 'primary
           #:level '3rd-10th
           #:coming-soon #f))
  
  (define (learntomod)
    (topic "LearnToMod Minecraft"
           (card-img-top class: "border-bottom" style: card-img-top-style src: (prefix/pathify conquering-covid-b-img-path))
           (list "Learn how to make cool, custom Minecraft mods with our instructors.  Tech requirements for this topic include pre-purchasing " (a class: "text-warning" href: "https://www.learntomod.com" "LearnToMod") " software ($29.99) and having a Minecraft account on Windows or Mac version 1.9.")
           #:schedule (and show-time?
                           "F 2-5pm")
           #:card-color 'warning
           #:level '3rd-10th))
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
  
  (define (graphic-design)
    (topic "Graphic Design with Code" 
           (card-img-top src: (prefix/pathify graphic-design-img-path))
           "Visual communication is almost always an end-goal of any end-user application. But code can only communicate as beautifully and clearly as its graphic designers can."
           #:level '7th-10th
           #:coming-soon #t))
  |#
  
  (list
   (list ; no install
    (python)
    (web-design)
    (virtual-engineering)
    (endless-runner)
    (maze-game)
    (scratch)
    (digital-art)
    (coding-adventures))
   (list ; install
    (adventure)
    (survival)
    (battle-arena)
    (3d-exploration)
    (3d-orbit)
    (learntomod))
   ))

(define (noinstall-topics #:show-time? [show-time? #f])
  (first (topics #:show-time? show-time?)))

(define (install-topics #:show-time? [show-time? #f])
  (second (topics #:show-time? show-time?)))