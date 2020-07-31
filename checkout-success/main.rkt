#lang at-exp racket

(provide checkout-success
         camp-checkout-success
         donate-success)

(require metacoders-dot-org-lib)

(define (checkout-success)
  (page checkout-success-top-path
        (normal-content
          (div class: "text-center p-4"
               (h1 "Payment Success")
               (p "You will receive an email with your receipt shortly.")
               (card class: "border-primary m-2"
                 (card-header class: "bg-primary text-white"                  
                              (h5 class: "m-0"
                                  "Finish Enrollment"))
                 (card-body
                  (p "Now we need your student's info! Please fill out the registration information for each student:")
                  (a id: "formUrl"
                     href:"https://docs.google.com/forms/d/e/1FAIpQLSd1VM1_UvUtCP1bBaH6LN_3OlPxriZx7euotdfBmg8Z8Ftacg/viewform"
                     class:"btn btn-primary"
                     'role: "button"
                     "CLICK HERE")))
               #;(h4 class: "mt-5 mb-4" "Purchase Summary")
               #;(card class: "border-secondary m-2"
                (card-header class: "bg-secondary text-white"
                             (h5 class: "m-0"
                                 (span id: "header-location" "Location") " - "
                                 (span id: "header-topic" "Topic")))
                (card-body
                 (div class: "row text-left"
                      (col-lg-6 class: "col-xs-12"
                                (table class: "table table-striped table-bordered"
                                       ;(tr (td (b "City: " )) (td id: "city" "City"))
                                       ;(tr (td (b "Topic: " )) (td id: "topic" "Topic"))
                                       (tr (td (b "Grades")) (td id: "grades" "Grades")) ;grade-range
                                       (tr (td (b "Total Meetings")) (td id: "total-meetings" "Total Meetings")) ;(length meeting-dates)))
                                       (tr (td (b "Meets on")) (td id: "meets-on" "Day of Week"))                ;(~a (meeting-date->weekday (first meeting-dates)) "s")))
                                       (tr (td (b "Time")) (td id: "time" "Time"))                               ;start-time " - " end-time))
                                       (tr (td (b "Start Date")) (td id: "start-date"))                          ;(first meeting-dates)))
                                       (tr (td (b "Location")) (td (span id: "location" "Location") (br)
                                                                     (a id: "address" target:"_blank" href: "http://maps.google.com" "Address")))
                                       (tr (td (b "Price")) (td id: "price" "Price")) ;(if (> discount 0)
                                                                                        ;    (list (s class: "text-danger"
                                                                                        ;             (~a "$" price))
                                                                                        ;          " $" (- price discount) "/student")
                                                                                        ;    (~a "$" price "/student"))))
                                       (tr (td (b "Schedule: ")) (td id: "meeting-dates" "Meeting Dates"))        ;(print-dates meeting-dates)))
                                       ))
                      (col-lg-6 class: "col-xs-12 d-flex flex-column justify-content-between"
                                (div (h5 "Course Description:")
                                     (p id: "description" "Description")))
                      )))
               @script/inline{
 function setValues(){
  var urlObject = (new URL(window.location.href));
  
  var cityValue = urlObject.searchParams.get('city');
  var locationValue = urlObject.searchParams.get('location');
  var topicValue = urlObject.searchParams.get('topic');

  var gradesValue = urlObject.searchParams.get('grades');
  var totalMeetingsValue = urlObject.searchParams.get('total-meetings');
  var meetsOnValue = urlObject.searchParams.get('meets-on');
  var timeValue = urlObject.searchParams.get('time');
  var startDateValue = urlObject.searchParams.get('start-date');
  var addressValue = urlObject.searchParams.get('address');
  var addressLinkValue = urlObject.searchParams.get('address-link');
  var priceValue = urlObject.searchParams.get('price');
  var scheduleValue = urlObject.searchParams.get('meeting-dates');
  var descriptionValue = urlObject.searchParams.get('description');
  
  document.getElementById('header-location').innerHTML = locationValue;
  document.getElementById('header-topic').innerHTML = topicValue;
  
  document.getElementById('grades').innerHTML = gradesValue;
  document.getElementById('total-meetings').innerHTML = totalMeetingsValue;
  document.getElementById('meets-on').innerHTML = meetsOnValue;
  document.getElementById('time').innerHTML = timeValue;
  document.getElementById('start-date').innerHTML = startDateValue;
  document.getElementById('location').innerHTML = locationValue;
  document.getElementById('address').innerHTML = addressValue;
  document.getElementById('address').href = addressLinkValue;
  document.getElementById('price').innerHTML = priceValue;
  document.getElementById('meeting-dates').innerHTML = scheduleValue;
  document.getElementById('description').innerHTML = descriptionValue;
  
  document.getElementById('formUrl').href = 
  'https://docs.google.com/forms/d/e/1FAIpQLSeo6vHe7gyNLl-BLNfOWIGmHyj3tN7Y7WNhsfH49DokINyt5Q/viewform?usp=pp_url&' + 
  '&entry.1401296940=' + encodeURI(cityValue) + 
  '&entry.672430774=' + encodeURI(locationValue) + 
  '&entry.1595827644=' + encodeURI(topicValue);
 }
 setValues();
}
               ))))

(define (camp-checkout-success)
  (page camp-checkout-success-top-path
        (normal-content
          (div class: "text-center p-4"
               (h1 "Payment Success")
               (p "You will receive an email with your receipt shortly.")
               (card class: "border-primary m-2"
                 (card-header class: "bg-primary text-white"                  
                              (h5 class: "m-0"
                                  "Finish Enrollment"))
                 (card-body
                  (p "Now we need your student's info! Please fill out the registration information for each student:")
                  (a id: "formUrl"
                     href:"https://docs.google.com/forms/d/e/1FAIpQLSe7qfncd3qyVlylYsc9rph6k86MstLnbVIUmBXUhQ5slSbsww/viewform"
                     class:"btn btn-primary"
                     'role: "button"
                     "CLICK HERE")))
               (h4 class: "mt-5 mb-4" "Purchase Summary")
               (card class: "border-secondary m-2"
                (card-header class: "bg-secondary text-white"
                             (h5 class: "m-0"
                                 (span id: "header-location" "Location") " - "
                                 (span id: "header-topic" "Topic")))
                (card-body
                 (div class: "row text-left"
                      (col-lg-6 class: "col-xs-12"
                                (table class: "table table-striped table-bordered"
                                       (tr (td (b "Grades")) (td id: "grades" "Grades")) 
                                       (tr (td (b "Camp Time")) (td id: "time" "Time"))
                                       (tr (td (b "Includes Lunch?" (td id: "lunch" "TBA"))))
                                       (tr (td (b "Start Date")) (td id: "start-date"))
                                       (tr (td (b "Location")) (td (span id: "location" "Location") (br)
                                                                     (a id: "address" target:"_blank" href: "http://maps.google.com" "Address")))
                                       (tr (td (b "Price")) (td id: "price" "Price"))
                                       (tr (td (b "Schedule")) (td id: "meeting-dates" "Meeting Dates"))
                                       ))
                      (col-lg-6 class: "col-xs-12 d-flex flex-column justify-content-between"
                                (div (h5 "Camp Description:")
                                     (p id: "description" "Description")))
                      )))
               @script/inline{
 function setValues(){
  var urlObject = (new URL(window.location.href));
  
  var cityValue = urlObject.searchParams.get('city');
  var locationValue = urlObject.searchParams.get('location');
  var topicValue = urlObject.searchParams.get('topic');

  var gradesValue = urlObject.searchParams.get('grades');
  var timeValue = urlObject.searchParams.get('time');
  var lunchValue = urlObject.searchParams.get('lunch');
  var startDateValue = urlObject.searchParams.get('start-date');
  var addressValue = urlObject.searchParams.get('address');
  var addressLinkValue = urlObject.searchParams.get('address-link');
  var priceValue = urlObject.searchParams.get('price');
  var scheduleValue = urlObject.searchParams.get('meeting-dates');
  var descriptionValue = urlObject.searchParams.get('description');
  
  document.getElementById('header-location').innerHTML = locationValue;
  document.getElementById('header-topic').innerHTML = topicValue;
  document.getElementById('grades').innerHTML = gradesValue;
  document.getElementById('time').innerHTML = timeValue;
  document.getElementById('lunch').innerHTML = lunchValue;
  document.getElementById('start-date').innerHTML = startDateValue;
  document.getElementById('location').innerHTML = locationValue;
  document.getElementById('address').innerHTML = addressValue;
  document.getElementById('address').href = addressLinkValue;
  document.getElementById('price').innerHTML = priceValue;
  document.getElementById('meeting-dates').innerHTML = scheduleValue;
  document.getElementById('description').innerHTML = descriptionValue;
  
  document.getElementById('formUrl').href = 
  'https://docs.google.com/forms/d/e/1FAIpQLSeo6vHe7gyNLl-BLNfOWIGmHyj3tN7Y7WNhsfH49DokINyt5Q/viewform?usp=pp_url&' + 
  '&entry.1401296940=' + encodeURI(cityValue) + 
  '&entry.672430774=' + encodeURI(locationValue) + 
  '&entry.1595827644=' + encodeURI(topicValue);
 }
 setValues();
}
               ))))

(define (donate-success)
  (page donate-success-top-path
        (normal-content
          (div class: "text-center p-4"
               (h1 "Payment Success")
               (p "Thank you for your donation. You will receive an email with your receipt shortly.")
               (br)
               (h4 "Add a message to your donation!")
               (p "Click below to let us know why you are donating (anonymous or not):")
               (a id: "formUrl"
                  href:"https://docs.google.com/forms/d/e/1FAIpQLScuznm2TWaUaGh2UMPQby4V8jjaFluq6NCyXYJNAj_9atYA3w/viewform"
                  class:"btn btn-primary"
                  'role: "button"
                  "Finish Donation")
               (br)
               ))))
