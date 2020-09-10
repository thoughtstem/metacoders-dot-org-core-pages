#lang at-exp racket

(provide genentech)

(require (except-in metacoders-dot-org-lib script)
         (prefix-in normal: metacoders-dot-org-lib)
         website-js/components/l-system
         website-js
         "../topics.rkt"
         "../customer-testimonials.rkt"
         )

(define KEY (make-parameter "pk_live_Kd7tDKVnPMvyCyk5oAuSkbju00pa0xJPPL")
  ;(make-parameter "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA")
  )

(define (gems n) (span n " " (i class:"fas fa-gem")))

(define (genentech)
  (page genentech-top-path
        (normal-content-wide
          #:head (list (title "Diversity in Coding Scholarship")
                       (meta name: "description" content: "For Students of OUSD & VUSD")
                       (common-critical-css)
                       (link 'rel: "preconnect" href:"https://q.stripe.com")
                       (link 'rel: "preconnect" href:"https://m.stripe.com")
                       (normal:script src:"https://js.stripe.com/v3")
                       )
          #:defer-css #t
          (include-p5-js)
          (jumbotron-header-section)
          (scholarship-details)
          (scholarship-about)
          (genentech-credit)
          (scholarship-application)
          (customer-testimonial-section)
          )))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "Diversity in Coding Scholarship"
    #:tagline "For Students of OUSD & VUSD" 
    #:percent-height "60vh"
    #:image-path over-shoulder-game-path
    #:alt-tag "Student playing a game he coded."))



;;VERSION ONE
;;All text

(define (scholarship-details)
  (jumbotron class: "mb-0 pb-3 bg-white"
             (container
              (p class: "text-center" "MetaCoders is excited to offer " (b "200 scholarships") " for K-8th students in San Diego County. This program is part of an initiative to bring more coding education to communities that are under-represented in computer science. Each recipient will receive 10 hours of high-quality coding education all taught online and in real time by MetaCoders Coding Coaches -- completely free!")
              (row class: "align-items-center"
                   (div class: "col-md-12 col-lg-8"
                    (h5 "Who Can Apply?")
                    (p "This opportunity is available to students in the Vista and Oceanside Unified School Districts who identify as persons of color and/or female.")
                    (h5 "How Do I Apply?")
                    (p "Please fill out the form below. Scholarships will be awarded on a rolling basis beginning September 21 and scholarship credits may be used through January 22, 2021.  For the greatest chance of receiving a scholarship, apply today!")
                    (h5 "What Do I Learn?")
                    (p "Scholarship awardees will receive 10 hours of coding education in our Virtual Coding Club. Visit " (a href: "https://metacoders.org/coding-club.html" "metacoders.org/coding-club")" for more information on topics and times.")
                    (h5 "What Hardware Do I Need?")
                    (p "Students must have access to a laptop, desktop (with Windows or macOS), or a Chromebook with access to the internet, a microphone, and a webcam."))                   
                   (div class: "col-8 col-md-6 col-lg-4 mx-auto"
                    (picture 
                     (source type: "image/webp" srcset: (prefix/pathify proud-coder-webp-path))
                     (source type: "image/jpeg" srcset: (prefix/pathify proud-coder-path))
                     (img src: (prefix/pathify proud-coder-path) 
                          class: "img-fluid rounded d-block w-100"
                          alt: "A young student proudly shows off his code."))))
                    )))

(define (scholarship-about)
  (jumbotron class: "mb-0 py-3"
             (container
              (row class: "align-items-center"
                   (div class: "col-8 col-md-6 col-lg-4 py-md-0 py-lg-3 mx-auto"
                    (picture 
                     (source type: "image/webp" srcset: (prefix/pathify 3-teens-smiling-while-coding-webp-path))
                     (source type: "image/jpeg" srcset: (prefix/pathify 3-teens-smiling-while-coding-path))
                     (img src: (prefix/pathify 3-teens-smiling-while-coding-path) 
                          class: "img-fluid rounded d-block w-100"
                          alt: "Three teen girls happily learning coding.")))
                   (div class: "col-md-12 col-lg-8 mt-2"
                    (h4 "Everyone Can Code")
                    (p "Computer science has a major diversity problem. People of color and women are incredibly underrepresented in CS careers, college degree programs, and K-12 level educational opportunities. The image of a software developer as white and male is more than just a stereotype: it is the reality of our education system and workforce. We need more diversity in this field not just for equality of opportunity, but to bring new ideas and keep innovating in the ever-growing technology sector!")
                    (p "MetaCoders partners with companies like Genentech to actively break down the barriers standing in the way of people of color, women, and girls by making coding classes accessible to as many students as possible. Scholarships and active outreach to schools and communities help us bring coding education to students who may not have access to such programs in their schools. MetaCoders also provides role models; our team of staff and volunteers is diverse in age, gender, race and ethnicity, showing students first-hand that " (b "anyone can be a coder.")))))))
;;END VERSION ONE

;;VERSION TWO
;;Cut the fluff
#|
(define (scholarship-details)
  (jumbotron class: "mb-0 pb-3 bg-white"
             (container
              (p class: "text-center" "MetaCoders is excited to offer " (b "200 scholarships") " for K-8th students in San Diego County. This program is part of an initiative to bring more coding education and opportunities to members of the communities that are under-represented in computer science. Each recipient will receive 10 hours of high-quality coding education all taught online and in real time by MetaCoders Coding Coaches -- completely free!")
              (row class: "align-items-center"
                   (div class: "col-md-10 col-lg-6 mx-auto"
                    (h5 "Who Can Apply?")
                    (p "This opportunity is available to students in the Vista and Oceanside Unified School Districts who identify as persons of color and/or female.")
                    (h5 "How Do I Apply?")
                    (p "Please fill out the form below. Scholarships will be awarded on a rolling basis beginning September 21 and scholarship credits may be used through January 22, 2021.  For the greatest chance of receiving a scholarship, apply today!")
                    )                   
                   (div class: "col-8 col-md-6 col-lg-4 mx-auto"
                    (picture 
                     (source type: "image/webp" srcset: (prefix/pathify proud-coder-webp-path))
                     (source type: "image/jpeg" srcset: (prefix/pathify proud-coder-path))
                     (img src: (prefix/pathify proud-coder-path) 
                          class: "img-fluid rounded d-block w-100"
                          alt: "A young student proudly shows off his code."))))
                    )))

(define (scholarship-about)
  (jumbotron class: "mb-0 py-3"
             (container
              (row class: "align-items-center"
                   (div class: "col-8 col-md-6 col-lg-4 py-md-0 py-lg-3 mx-auto"
                        (picture 
                         (source type: "image/webp" srcset: (prefix/pathify 3-teens-smiling-while-coding-webp-path))
                         (source type: "image/jpeg" srcset: (prefix/pathify 3-teens-smiling-while-coding-path))
                         (img src: (prefix/pathify 3-teens-smiling-while-coding-path) 
                              class: "img-fluid rounded d-block w-100"
                              alt: "Three teen girls happily learning coding.")))
                   (div class: "col-md-10 col-lg-6 mx-auto mt-2 my-lg-0"
                        (h5 "What Do I Learn?")
                        (p "Scholarship awardees will receive 10 hours of coding education in our Virtual Coding Club. Visit " (a href: "https://metacoders.org/coding-club.html" "metacoders.org/coding-club")" for more information on topics and times.")
                        (h5 "What Hardware Do I Need?")
                        (p "Students must have access to a laptop, desktop (with Windows or macOS), or a Chromebook with access to the internet, a microphone, and a webcam."))))))
|#
;; END VERSION TWO

                    

(define (genentech-credit)
  (jumbotron class: "my-0 py-3 bg-white"
             (container
              (h2 class: "text-center" "Funding for this Scholarship Generously Provided by")
              (a href: "https://www.gene.com/"
                 (picture 
                  (source type: "image/webp" srcset: (prefix/pathify genentech-logo-webp-path))
                  (source type: "image/jpeg" srcset: (prefix/pathify genentech-logo-path))
                  (img src: (prefix/pathify genentech-logo-path)
                       class: "img-fluid rounded d-block w-25 mx-auto"
                       alt: "Genentech logo"))))))


(define (topics-section)
  (jumbotron class: "mb-0"
             (container
               (h2 class: "text-center" "What Can Your Students Learn?")
               (br)
               (h5 class: "text-center" "The following topics can run on Chromebooks, macOS, or Windows and require no installation.")
               (p class: "text-center" "Code it all in a free online coding editor; no installation required!")
               (apply (curry responsive-row #:columns 3) (map display-topic (noinstall-topics #:show-time? #t)))
               (hr)
               (h5 class: "text-center" "The following topics require software to be installed on macOS or Windows.")
               (p class: "text-center" "Detailed instructions are sent upon credit purchase or upon request.")
               (apply (curry responsive-row #:columns 3) (map display-topic (install-topics #:show-time? #t)))
               )
             ))

(define (display-topic t)
  t)

(define (scholarship-application)
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
              #:line-color (~a primary 66);"rgba(255,193,7,0.4)"
              #:max-radius 0
              class: "card px-3 py-5 mb-0 bg-transparent"
              style: (properties 'overflow: "hidden")
              (container
               (card class: "border-primary"
                (card-header class: "h5 bg-primary text-white text-center"
                             "Submit the form below to apply for the scholarship!")
                (card-body
                 (form action: "https://docs.google.com/forms/u/1/d/e/1FAIpQLSd5uZWn8a3X5e8bR12ppdGj7cFmiPOPq8fZ54RFK_9oBNzfKw/formResponse"
                       ;entry.2077215683=sonny+jr
                       ;entry.1799593606=sonny@email.com
                       ;entry.1396717720=619-123-4567
                       ;entry.1054010153=sonny+jr
                       ;entry.56393326=2010-01-01
                       ;entry.1733469838=male
                       ;entry.1663616049=hispanic
                       ;entry.323010727=3rd
                       ;entry.1900729753=southbay
                       ;entry.134599855=hilltop
                       ;entry.43316897=learn+stuff
                        (div class:"form-group"
                            (label "Parent or Guardian Name")
                            (input type: "text" class: "form-control" name: "entry.2077215683"))
                       (div class:"form-group"
                            (label "Parent or Guardian Email")
                            (input type: "email" class: "form-control" name: "entry.1799593606"))
                       (div class:"form-group"
                            (label "Parent or Guardian Phone Number")
                            (input type: "text" class: "form-control" name: "entry.1396717720"))
                       (div class:"form-group"
                            (label "Student's Name")
                            (input type: "text" class: "form-control" name: "entry.1054010153"))
                       (div class:"form-group"  
                            (label "Student's Date of Birth")
                            (input type: "date" class: "form-control" name: "entry.56393326"))
                       (div class: "form-group"
                            (label class: "pr-4" "Student's Gender")
                            (div class: "form-check form-check-inline"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        id: "genderOption1"
                                        'value: "Male"
                                        'onchange: "toggleCustomInput();"
                                        name: "entry.1733469838")
                                 (label class: "form-check-label"
                                        'for: "genderOption1"
                                        "Male"))
                            (div class: "form-check form-check-inline"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        id: "genderOption2"
                                        'value: "Female"
                                        'onchange: "toggleCustomInput();"
                                        name: "entry.1733469838")
                                 (label class: "form-check-label"
                                        'for: "genderOption2"
                                        "Female"))
                            (div class: "form-check form-check-inline"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        name: "entry.1733469838"
                                        id: "genderOption3"
                                        'value: "other"
                                        'onchange: "toggleCustomInput();")
                                 (label class: "form-check-label"
                                        'for: "genderOption3"
                                        "Custom ")
                                 (input class: "form-control form-control-sm mx-2"
                                        type: "hidden"
                                        id: "genderTextInput"
                                        'placeholder: "Type here"
                                        'oninput: "toggleCustomGenderValue();")
  @script/inline{
  function toggleCustomInput(){
    var checked = document.getElementById("genderOption3").checked;
    if(checked){
       document.getElementById("genderTextInput").type = "text";
    } else{
       document.getElementById("genderTextInput").type = "hidden";
  }}
  function toggleCustomGenderValue(){
    var customValue = document.getElementById("genderTextInput").value;
    var checked = document.getElementById("genderOption3").checked;
    if(checked){
       document.getElementById("genderOption3").value = customValue;
    } else{
       document.getElementById("genderOption3").value = "other";
  }}}))
                       (div class: "form-group"
                            (label class: "mdb-main-label" "Student's Race/Ethnicity (choose all that apply)")
                            (div class: "form-check"
                                 (input class: "form-control form-control-sm mx-2"
                                        type: "hidden"
                                        id: "raceText"
                                        'value: "--fill in--"
                                        name: "entry.1663616049")
                                 
                                 (div class: "container"
                                      (div class: "row"
                                           (div class:  "col-md-4"
                                                (input class: "form-check-input" type: "checkbox" id: "raceOption1" 'onchange: "toggleOtherInput(); concatStrings();" 'value: "American Indian or Alaska Native, ")
                                                (label class: "form-check-label" 'for: "raceOption1" "American Indian or Alaska Native"))
                                           (div class:  "col-md-4"
                                                (input class: "form-check-input" type: "checkbox" id: "raceOption2" 'onchange: "toggleOtherInput(); concatStrings();" 'value: "Asian ,")
                                                (label class: "form-check-label" 'for: "raceOption2" "Asian"))
                                           (div class:  "col-md-4"
                                                (input class: "form-check-input" type: "checkbox" id: "raceOption3" 'onchange: "toggleOtherInput(); concatStrings();" 'value: "Black or African American, ")
                                                (label class: "form-check-label" 'for: "raceOption3" "Black or African American")))
                                      (div class: "row"
                                           (div class: "col-md-4"
                                                (input class: "form-check-input" type: "checkbox" id: "raceOption4" 'onchange: "toggleOtherInput(); concatStrings();" 'value: "Caucasian, ")
                                                (label class: "form-check-label" 'for: "raceOption4" "Caucasian"))
                                           (div class: "col-md-4"
                                                (input class: "form-check-input" type: "checkbox" id: "raceOption5" 'onchange: "toggleOtherInput(); concatStrings();" 'value: "Latinx or Hispanic, ")
                                                (label class: "form-check-label" 'for: "raceOption5" "Latinx or Hispanic"))
                                           (div class: "col-md-4"
                                                (input class: "form-check-input" type: "checkbox" id: "raceOption6" 'onchange: "toggleOtherInput(); concatStrings();" 'value: "Pacific Islander or Hawaiian, ")
                                                (label class: "form-check-label" 'for: "raceOption6" "Pacific Islander or Hawaiian")))
                                      (div class: "row col-md-4"
                                           (input class: "form-check-input" type: "checkbox" id: "raceOption7" 'onchange: "toggleOtherInput(); concatStrings();" 'value: "other")
                                           (label class: "form-check-label" 'for: "raceOption7" "Other")
                                           (input class: "form-control-md mx-2"
                                                  type: "hidden"
                                                  id: "raceTextInput"
                                                  'placeholder: "Type here"
                                                  'oninput: "toggleCustomValue(); concatStrings();")
                                           ))
 @script/inline{
  function toggleOtherInput(){
    var checked = document.getElementById("raceOption7").checked;
    if(checked){
       document.getElementById("raceTextInput").type = "text";
    } else{
       document.getElementById("raceTextInput").type = "hidden";
    }}
  function concatStrings(){
    var option1 = document.getElementById("raceOption1").value;
    var option2 = document.getElementById("raceOption2").value;
    var option3 = document.getElementById("raceOption3").value;
    var option4 = document.getElementById("raceOption4").value;
    var option5 = document.getElementById("raceOption5").value;
    var option6 = document.getElementById("raceOption6").value;
    var option7 = document.getElementById("raceTextInput").value;

    var selected1 = "";
    var selected2 = "";
    var selected3 = "";
    var selected4 = "";
    var selected5 = "";
    var selected6 = "";
    var selected7 = "";
 
    if (document.getElementById("raceOption1").checked){
        selected1 = option1;
    } else {
        selected1 = ""; }

    if (document.getElementById("raceOption2").checked){
        selected2 = option2;
    } else {
        selected2 = ""; }

    if (document.getElementById("raceOption3").checked){
        selected3 = option3;
    } else {
        selected3 = ""; }

    if (document.getElementById("raceOption4").checked){
        selected4 = option4;
    } else {
        selected4 = ""; }

    if (document.getElementById("raceOption5").checked){
        selected5 = option5;
    } else {
        selected5 = ""; }

    if (document.getElementById("raceOption6").checked){
        selected6 = option6;
    } else {
        selected6 = ""; }

    if (document.getElementById("raceOption7").checked){
        selected7 = option7;
    } else {
        selected7 = ""; }  
        
  document.getElementById("raceText").value = "".concat(selected1, selected2, selected3, selected4, selected5, selected6, selected7, '.');

  }
 function toggleCustomValue(){
  var customValue = document.getElementById("raceTextInput").value;
  var checked = document.getElementById("raceOption7").checked;
  if(checked){
     document.getElementById("raceOption7").value = customValue;
  } else{
     document.getElementById("raceOption7").value = "other";
  }}}))
#|
                       (div class: "form-group"
                            (label "Student's Race/Ethnicity (check all that apply)")
                            (div class: "form-check"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        id: "raceOption2"
                                        'value: "American Indian or Alaska Native"
                                        'onchange: "toggleOtherInput();"
                                        name: "entry.1663616049")
                                 (label class: "form-check-label"
                                        'for: "raceOption2"
                                        "American Indian or Alaska Native"))
                            (div class: "form-check"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        id: "raceOption3"
                                        'value: "Asian"
                                        'onchange: "toggleOtherInput();"
                                        name: "entry.1663616049")
                                 (label class: "form-check-label"
                                        'for: "raceOption3"
                                        "Asian"))
                            (div class: "form-check"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        id: "raceOption1"
                                        'value: "Black or African American"
                                        'onchange: "toggleOtherInput();"
                                        name: "entry.1663616049")
                                 (label class: "form-check-label"
                                        'for: "raceOption1"
                                        "Black or African American"))
                            (div class: "form-check"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        id: "raceOption4"
                                        'value: "Caucasian"
                                        'onchange: "toggleOtherInput();"
                                        name: "entry.1663616049")
                                 (label class: "form-check-label"
                                        'for: "raceOption4"
                                        "Caucasian"))
                            (div class: "form-check"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        id: "raceOption5"
                                        'value: "Latinx or Hispanic"
                                        'onchange: "toggleOtherInput();"
                                        name: "entry.1663616049")
                                 (label class: "form-check-label"
                                        'for: "raceOption5"
                                        "Latino or Hispanic"))
                            (div class: "form-check"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        id: "raceOption6"
                                        'value: "Pacific Islander or Hawaiian"
                                        'onchange: "toggleOtherInput();"
                                        name: "entry.1663616049")
                                 (label class: "form-check-label"
                                        'for: "raceOption6"
                                        "Pacific Islander or Hawaiian"))
                            (div class: "form-check  form-check-inline"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        id: "raceOption7"
                                        'value: "other"
                                        'onchange: "toggleOtherInput();"
                                        name: "entry.1663616049")
                                 (label class: "form-check-label"
                                        'for: "raceOption7"
                                        "Other ")
                                 (input class: "form-control form-control-sm mx-2"
                                        type: "hidden"
                                        id: "raceTextInput"
                                        'placeholder: "Type here"
                                        'oninput: "toggleCustomValue();")
  @script/inline{
  function toggleOtherInput(){
    var checked = document.getElementById("raceOption7").checked;
    if(checked){
       document.getElementById("raceTextInput").type = "text";
    } else{
       document.getElementById("raceTextInput").type = "hidden";
    }}
  function toggleCustomValue(){
    var customValue = document.getElementById("raceTextInput").value;
    var checked = document.getElementById("raceOption7").checked;
    if(checked){
       document.getElementById("raceOption7").value = customValue;
    } else{
       document.getElementById("raceOption7").value = "other";
  }}}))
|#
                       (div class: "form-group"
                            (label "Student's Grade Level")
                            (select class: "form-control" name: "entry.323010727"
                                    (option "Kinder")
                                    (option "1st Grade")
                                    (option "2nd Grade")
                                    (option "3rd Grade")
                                    (option "4th Grade")
                                    (option "5th Grade")
                                    (option "6th Grade")
                                    (option "7th Grade")
                                    (option "8th Grade")))
                       (div class: "form-group"
                            (label "Student's School District")
                            (select class: "form-control" name: "entry.1900729753"
                                    (option "Vista Unified School District")
                                    (option "Oceanside Unified School District")))
                       (div class:"form-group"  
                            (label "Student's School Name")
                            (input type: "text" class: "form-control" name: "entry.134599855"))
                       (div class:"form-group"  
                            (label "What does the student hope to gain from this experience?")
                            (textarea class: "form-control" name: "entry.43316897"))
                       (button-primary type: "submit" name: "submit"
                                       "Submit"))
                 (br)
                 (container class: "text-center"
                            (i "Thank you for your application. You will hear back from our team soon.")))))))
