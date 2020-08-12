#lang racket

(provide terms-and-conditions)

(require metacoders-dot-org-lib)

(define (terms-and-conditions)
  (page terms-and-conditions-path
        (normal-content #:head (list
            (title "Terms and Conditions for Classes and Camps | MetaCoders")
            (meta name: "description" content: "MetaCoders’ Terms and Conditions apply to all camps and classes purchased through metacoders.org."))
          (br)
          (h1 "Terms and Conditions")
          (terms-for-online-coding-club)
          ;(terms-for-refunds)
          ;(terms-for-late-pickup-fees)
          ;(terms-for-multi-session-discounts)
          ;(terms-for-students-arriving-to-class)
          ;(terms-for-student-pickup-after-class)
          ;(parents-in-classroom-policy)
          (terms-for-phonecalls-texts)
          (terms-for-media-policy)
          (privacy-policy)
          (miscellaneous)
          (br)
          )))


#|
(define (terms-for-refunds)
  (container
    (h3 "MetaCoders Refund/Cancellation Policy for In-Person Classes & Camps")
    (p "Parents who wish to cancel an enrollment for a future class may do so for a full refund minus the following cancellation fees:")
    (ul
      (li "Cancellations more than 1 week in advance of the first class will be eligible for a full refund minus non-refundable credit card transaction fees (generally 2.9% + 30 cents.)")
      (li "Cancellations between 1 week and 24 hours in advance of the first class will be eligible for a full refund minus a $20 cancellation fee.")
      (li "Cancellations less than 24 hours in advance of the first class start will be eligible for a full refund minus a $40 cancellation fee.")
      (li "Cancellations/withdrawals after the first meeting but before the second class meeting will be a partial refund (we will charge for the pro-rated cost of the single class) minus a $40 cancellation fee.")
      (li "Cancellations from the second class meeting to the halfway point of the session will be a refund of 50% of the tuition.")
      (li "No refund after the halfway point of the session."))
    (p "NOTE: These terms and conditions only apply when purchases are made on the MetaCoders website (www.metacoders.org). Purchases of MetaCoders programs made on other websites have their own Terms and Conditions which supersede these.")))
          
(define (terms-for-late-pickup-fees)
  (container
    (h3 "MetaCoders Late Pick-up Fee")
    (p "If you’re running late, please give us a call at 858–869–9430 so we can tell our staff that you are on your way.")
    (p "Parents who are late to pick-up their child(ren) will be charged a fee. This fee is $15 for every 15 minute period that passes since class has ended. For example, if class ends at 2:55pm, and a parent arrives to pick up their child(ren) at 3:10pm (15 minutes late), the card on file will be charged a $15 fee. (And if there is no card on file, an invoice for $15 will be sent.) If class ends at 2:55pm, and a parent arrives to pick up their child(ren) at 3:25 (30 minutes late), the parent will be charged $30, etc.")
    (p "For parents who are consistently 5–14 minutes late for pick-up after more than 1 warning, MetaCoders may begin charging pro-rated late pick-up fees (i.e. $10 for 10 minutes, $14 for 14 minutes.)")
    (p "If a parent would prefer for their child(ren) to be self-dismissed or dismissed to an extended daycare program on campus, please inform our staff at contact@metacoders.org at the time of registration. Without additional direction from parents regarding their child(ren)’s dismissal, we always make student safety a priority, and we will wait with your child until your child is picked up or until we have verbal or written confirmation from the parent to release their child.")))


(define (terms-for-multi-session-discounts)
  (container
    (h3 "MetaCoders Multi-Session Discount")
    (p "The best way to become proficient in computer science and coding is with practice. To that end, MetaCoders offers incentives for you to enroll your child(ren) in more sessions during the school-year. The more sessions you purchase simultaneously, the larger this bulk discount will be. Since you can purchase for multiple children at once, this bulk discount acts as a “multi-sibling” discount. You can see this discount at the bottom of the screen as you add sessions to your shopping cart. This discount is applied on the check-out page after any coupon codes are applied. The discount scales with your cart total (e.g. you’ll get $40 off with a purchase of $500, or $120 off with a purchase of $1000, etc.). Note that if you purchase only one session at a time, the discount cannot be applied after the fact.")))

(define (terms-for-students-arriving-to-class)
  (container
    (h3 "Students Arriving to After-School Programs Policy")
    (p "MetaCoders instructors will always pick-up Kindergarteners directly from their classroom. If your child is a Kindergartener, please indicate their classroom at registration so we know where to pick up your child. However, it is our expectation that students who are in 1st grade or higher grades will arrive to our class without assistance. But we understand that sometimes students forget to go to after-school programs! Therefore, for the first 3 weeks of class, for any students who are not present in the classroom within the first 15 minutes of class, we will call parents to ask if this is a planned absence or if maybe their child forgot to go to class. After the first 3 weeks, students should be able to arrive to class on their own without reminders.")
    (p "To assist our instructors, please let us know at the time of registration if your child normally attends any extended daycare programs after school. This can be helpful for the first 3 weeks when locating students who forget to come to coding class.")))

(define (terms-for-student-pickup-after-class)
  (container
    (h3 "Student Pick-up After Class Policy")
    (p "Because we want student pick-up after class to be as seamless as possible, we generally do not check parent IDs at student pick-up. However, MetaCoders instructors always ensure that students go home with an adult they know - whether that may be a mom, dad, grandparent, or a friend’s parent who is managing the carpool that day. For this reason, there’s no need to inform us in advance about carpools.")
    (p "However, if you have any concerns with your child’s ability to recognize the adult picking them up OR if there are certain adults who are not allowed to pick up your child, please email us at contact@metacoders.org with a list of adults who are allowed or not allowed to pick-up your child. For students who have adults listed as “allowed” or “not allowed”, we will check IDs of adults at pick-up and if a disallowed adult or an adult not listed as allowed tries to pick up your child, we will keep your student with us and try to reach you by phone for confirmation. (Note: in this unlikely situation, if we are unable to reach you by phone, you may incur late pick-up fees - see the late pick-up policy for more information.)")))

(define (parents-in-classroom-policy)
  (container
    (h3 "Parents Visiting Classroom Policy")
    (p "MetaCoders strives for both transparency in the classroom for parents and the safest learning environment for our students. Many schools do not allow parents to visit after-school program classrooms for student safety reasons, and these school policies will always override MetaCoders’ own policy herein. However, if a school does allow parents to visit our classrooms, we welcome parents to observe for the last 10 minutes of class. While the class is in progress, we ask parents to be mindful to not distract their student or the class, but once the end of class when the Coding Coach (teacher) has dismissed everyone, you’re welcome to check in with your student, ask them questions, and have them show you what they’ve been working on!")
    (p "If parents would like to visit our classrooms for longer than the last 10 minutes of class, please contact us at 858–375-4097. We may require a background check (many schools require this of parents assisting in their classrooms during the school day), as well as a short online training so that you can help support our Coding Coaches throughout the class as a volunteer. In order for us to serve all students in our classes fairly, our Coding Coaches and staff reserve the right to ask any parents who are disrupting the class to no longer visit the classroom.")))

(define (terms-for-student-personal-technology)
  (container
    (h3 "")
    (p "We provide all the technological equipment that students need for our classes. Furthermore, we want to make sure our students are able to learn in a distraction-free environment, so we encourage students to leave their cell phones, laptops, and other devices at home. However, if you would like your child to have their cell phone, smart watch, or other communication device with them at class for emergency purposes, these devices should be powered off and left in a backpack during the class. If you ever need to contact your child during the class, please call our main office at 858-375-4097 or email us at contact@metacoders.org, and we will pass on information or connect you with your child as needed.")))
|#

(define (terms-for-online-coding-club)
  (container
    (h3 "Coding Club Terms and Conditions")
    (b "Student Behavior Policy and Expectations")
    (ul
      (li "Students should always be respectful of both other students and the instructor.")
      (li "Only classroom appropriate language and messages are to be used/sent during class in the chatroom or through audio.")
      (li "Students are to log on with positive and supportive attitudes.")
      (li "Have fun!")
      )
    (b "Video Publishing and Privacy")
    (p "Sessions may be recorded and shared online for educational and promotional purposes. Student privacy and safety are always our utmost concern. Although students' faces may be shown, we will ensure no identifying information like names or locations are shown in any recording. If you have any further concerns, please contact us at contact@metacoders.org.")
    (p "Note: As with any video conferencing service, sessions can be recorded by other students from their computers. MetaCoders cannot control this or how these recordings may be used. If you are concerned about your student's face being shown in potential student recordings, we recommend helping your student get started at the beginning of each session to make sure their video camera is off. You are also able to manipulate the name of your student in Zoom to show a pseudonym if you so choose. Please email us at contact@metacoders.org in advance if you plan to use a pseudonym so that we can accurately keep track of attendance in our sessions.")
    (b "Credits")
    (p "Any Credits purchased through MetaCoders have no expiration date.")
    (p "If for any reason a customer wishes to receive a refund for their purchase of Credits, they may do so for a full refund except as follows:")
    (ul
      (li "If the parent has purchased the credits in a bulk package in advance, any credits they have used will be converted to the current rate. They will instead receive a refund for the balance after that conversion.")
      (li "If one year or longer has passed since the date of purchasing, no refund will be given for those credits.")
      )
    ))

(define (terms-for-phonecalls-texts)
  (container
    (h3 "Auto Opt-in to Phonecalls & Non-Automated Texts")
    (p "By providing us with your phone number at registration, you give MetaCoders permission to call and/or text you regarding the program your child is currently enrolled in, as well as reminders about upcoming programs. Parents should expect to receive no more than 2 texts per month about upcoming programs and can expect closer to 0–1 texts per month on average. Parents can opt-out of texts at any time by emailing us at contact@metacoders.org.")))

(define (terms-for-media-policy)
  (container
    (h3 "MetaCoders Media Policy")
    ;(p "When you register for the class, there is an option to provide MetaCoders with photo/video release that allows us to take pictures and video of your child for promotional purposes. It is always your choice whether you provide us with a photo/video release for your child. On rare occasions, news networks will come film our after-school programs and camps, and only children who have photo/video releases will be recorded for the news.")
    ;(p "For quality assurance, MetaCoders sometimes records our classes to monitor our instructors. Video recorded for the purpose of quality assurance are not saved or ever used for promotional purposes.")
    (p "By registering for MetaCoders classes, you agree that all projects and work created by students while at MetaCoders may be used by MetaCoders in promotional materials, online, and other print media and may be shared and used by corporate partners, the media, or other organizations who work with MetaCoders. You also agree that MetaCoders, its owners, agents, partners, facility providers, and employees cannot be held liable for damages and injuries associated with said publishing, including any and all claims based on negligence. Students names will never be published, without the express permission of parents.")))

(define (privacy-policy)
  (container
    (h3 "MetaCoders Privacy Policy")
    (p "MetaCoders respects your privacy and will not misuse any data you provide us about yourself and/or your children. Specifically, we guarantee:")
    (ul
      (li "We won’t sell your information to anyone!")
      (li "We require your email address so that we can contact you about your child’s experience in class, including sending regular parent reports and future opportunities you may be interested in. If you would like to be removed from an email list at any time, just let us know."))))


(define (miscellaneous)
  (container
    (h3 "Miscellaneous Policies")
    (p "Parents must enroll their children in the appropriate grade level class. MetaCoders can, at its sole discretion, decide whether a student belongs in a higher grade level or lower grade level class. MetaCoders curriculum developers specifically design curriculum to be appropriate for specific grade level ranges, so to ensure the most optimal experience for all students in our classes, we will always put students in an appropriate grade level class to start before re-evaluating. If a parent enrolls their child in a class which does not match their child’s grade level (e.g. if a parent enrolls their 2nd grader in a 3rd–5th grade class), MetaCoders will inform the parent of the mistake and offer options to remedy, including transferring to a class in the appropriate grade level range or a refund.")
    (p "If your child requires a full-time aide during the school day, MetaCoders reserves the right to require an aide in our after-school programs. In some situations, MetaCoders may be able to find an additional instructor for the class to act as this aide. The cost of an additional instructor is $16/hour (or $16/meeting for a 1-hr class). If you believe your child will require an aide during our class, please contact us before the first class is scheduled to begin.")
    (p "Also, any child that is so disruptive in the classroom as to require extraordinary attention from the MetaCoders instructor(s) may be removed from the class. The class fees will be refunded minus the cost of the classes that have already passed.")))
          
          
          
          
          
          
                   
