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
          #:head (list (title "Genentech Coding Scholarship")
                       (meta name: "description" content: "Available for Students from the Vista and ____ School District")
                       (common-critical-css)
                       (link 'rel: "preconnect" href:"https://q.stripe.com")
                       (link 'rel: "preconnect" href:"https://m.stripe.com")
                       (normal:script src:"https://js.stripe.com/v3")
                       )
          #:defer-css #t
          (include-p5-js)
          (jumbotron-header-section)
          (updated-list-value-prop)
          (scholarship-application)
          (customer-testimonial-section)
          (topics-section)
          )))

(define (jumbotron-header-section)
  (mc-jumbotron-header
    #:title "Genentech Coding Scholarship"
    #:tagline "Professional coding education for your home learning experience." 
    #:percent-height "60vh"
    #:image-path students-in-row-path
    #:alt-tag "Kids coding together in a small group."))


(define (updated-list-value-prop)
  (jumbotron class: "mb-0 bg-white"
             (container
              (h2 "Genentech's Diversity in Coding Scholarship: For Students of OUSD & VUSD")
              (br)
              (h3 "Overview")
              (p "Of all STEM fields, computer science in particular has a major diversity problem. Society's stereotypical conception of a software developer as a white male is mirrored in decades of participation data from computer science education at the high school and university levels, as well as decades of workforce demographics data in technology sectors. People of color and women in particular are incredibly underrepresented in computer science. At the K-12 level, there are several reasons for this:")
              (li "Lack of access: students may not have access to computers at home or coding education at their school.")
              (li "Self-selection: students may not think a woman or a person of color \"belongs\" in computer science, if they do not see role models there.")
              (li "Biases of parents: parents may have certain biases about who \"belongs\" in computer science and therefore may not encourage their children to pursue it.")
              (br)
              (p "The exclusion of people of color and women from the field of computer science is a major problem for the American economy that must be addressed. The Bureau of Labor Statistics consistently shows growth in technology sectors outpacing America's ability to produce graduates with relevant degrees. If 70% of America grows up believing they do not belong in computer science, we will never be able to produce enough graduates with computer science and technology degrees to keep up with economic demand.")
              (p "This grant would be a step towards solving this diversity problem in the Vista/Oceanside region and encouraging more people of color and women to pursue computer science and join the STEM workforce in the future. This grant would:")
              (li "Provide access to students who otherwise do not have access to a computer or coding education.")
              (li "Provide role models to students who are women or people of color (75% of MetaCoders teaching staff are women or people of color).")
              (li "Provide education to parents about the long-term value of their children pursuing computer science and coding education.")
              (br)
              (p "Furthermore, during the COVID-19 pandemic, access to K-12 STEM opportunities is even more limited than usual. Many parents are facing financial hardship due to lost jobs or reduced hours and can not afford to enroll their children in extracurricular STEM activities. Due to systemic racial inequalities, we expect this financial hardship to fall harder on people of color. Therefore, this grant is also a step towards providing STEM educational access to communities that need it most during the COVID-19 pandemic.")

              (h3 "Scholarships")
              (p "Genentech is offering 200 scholarships to K-8th students in the Vista and Oceanside Unified School Districts who are either persons of color or female. These two groups have been frequently identified as underrepresented in the field of computer science and in various STEM fields in general. Scholarships would provide students the opportunity to join MetaCoders' online coding classes for 10 hours each for free. Students would be able to join online sessions at their convenience between the hours of 1pm-4pm, M-F.")

              (h3 "Scholarship Criteria & Application Process")
              (p "In order to verify the scholarship criteria we will be collecting the following: students' names, basic information (e.g. age, grade level, gender, race), email and phone number of their parents (or guardians) so that we can contact them if they are awarded a scholarship. Finally, in the case of an overwhelming number of scholarship applicants, there will be a short answer question: \"What does the student hope to gain from this experience?\" This question will only be used to break ties. Scholarships will primarily be awarded on a first-come, first-serve basis, taking into account our goals for how many scholarships to award to each demographic.")

              (h3 "Scholarship Awarding Process")
              (p "Scholarships will be awarded on a rolling basis throughout the grant period. We plan to award 50 scholarships to female students and 150 scholarships to students of color (or students of color who are also female). We expect, based on the demographics of this region, most scholarships will be awarded to Latino students, but we will also strive to award scholarships to students who are African American, American Indian or Alaskan Native, and Pacific Islander.")

              (h3 "Educational Activities of Scholarship Awardees")
              (p "As soon as students are awarded a scholarship, they will be able to login to MetaCoders' Zoom classrooms at the start of any hour between the hours of 1pm-4pm, M-F. Students can login for multiple hours at a time, or just an hour here and there. Students will be able to choose any of the topics that are available for their age.")

              (h3 "Required Hardware")
              (p "Students must have access to a laptop or desktop (with Windows or macOS, or a Chromebook. Our classes are through Zoom so students will also need access to a microphone and a webcam.")
              )))


(define (topics-section)
  (jumbotron class: "mb-0"
             (container
               (h2 class: "text-center" "What Can Your Students Learn?" )
               (br)
               (h5 class: "text-center" "The following topics can run on Chromebooks, macOS, or Windows and require no installation.")
               (apply (curry responsive-row #:columns 3) (map display-topic (noinstall-topics)))
               (hr)
               (h5 class: "text-center" "The following topics require software to be installed on macOS or Windows.")
               (apply (curry responsive-row #:columns 3) (map display-topic (install-topics)))
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
                            (label "Student's Gender")
                            (div class: "form-check"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        ;name: "exampleRadios"
                                        id: "genderOption1"
                                        'value: "Male"
                                        'onchange: "toggleCustomInput();"
                                        name: "entry.1733469838")
                                 (label class: "form-check-label"
                                        'for: "genderOption1"
                                        "Male"))
                            (div class: "form-check"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        ;name: "exampleRadios"
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
                                        ;name: "exampleRadios"
                                        id: "genderOption3"
                                        'value: "other"
                                        'onchange: "toggleCustomInput();")
                                 (label class: "form-check-label"
                                        'for: "genderOption3"
                                        "Custom ")
                                 (input class: "form-control form-control-sm mx-2"
                                        type: "hidden"
                                        ;name: "customGenderInput"
                                        id: "genderTextInput"
                                        'placeholder: "Type here"
                                        name: "entry.1733469838")
  @script/inline{function toggleCustomInput(){
  var checked = document.getElementById("genderOption3").checked;
  if(checked){
   document.getElementById("genderTextInput").type = "text";
   } else{
   document.getElementById("genderTextInput").type = "hidden";
  }
  }}))
                       (div class: "form-group"
                            (label "Student's Race")
                            (div class: "form-check"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        ;name: "exampleRadios"
                                        id: "raceOption1"
                                        'value: "African American"
                                        'onchange: "toggleOtherInput();"
                                        name: "entry.1663616049")
                                 (label class: "form-check-label"
                                        'for: "raceOption1"
                                        "African American"))
                            (div class: "form-check"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        ;name: "exampleRadios"
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
                                        ;name: "exampleRadios"
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
                                        ;name: "exampleRadios"
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
                                        ;name: "exampleRadios"
                                        id: "raceOption5"
                                        'value: "Latino or Hispanic"
                                        'onchange: "toggleOtherInput();"
                                        name: "entry.1663616049")
                                 (label class: "form-check-label"
                                        'for: "raceOption5"
                                        "Latino or Hispanic"))
                            (div class: "form-check"
                                 (input class: "form-check-input"
                                        type: "radio"
                                        ;name: "exampleRadios"
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
                                        ;name: "exampleRadios"
                                        id: "raceOption7"
                                        'value: "Other"
                                        'onchange: "toggleOtherInput();")
                                 (label class: "form-check-label"
                                        'for: "raceOption7"
                                        "Other ")
                                 (input class: "form-control form-control-sm mx-2"
                                        type: "hidden"
                                        ;name: "otherRaceInput"
                                        id: "raceTextInput"
                                        'placeholder: "Type here"
                                        name: "entry.1663616049")
  @script/inline{function toggleOtherInput(){
  var checked = document.getElementById("raceOption7").checked;
  if(checked){
   document.getElementById("raceTextInput").type = "text";
   } else{
   document.getElementById("raceTextInput").type = "hidden";
  }
  }}))
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
