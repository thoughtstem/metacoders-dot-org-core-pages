#lang at-exp racket

(provide checkout-success)
(require metacoders-dot-org-lib)

(define (checkout-success)
  (page checkout-success-top-path
        (normal-content
          (div class: "text-center p-4"
               ;'onload: "setValues()"
               (h1 "Payment Success")
               
               (form class: "row"
                     (table class: "m-2 col-md-5 mx-auto table table-sm table-bordered table-striped text-left"
                            (tr (td (strong "City: ") (input type: "text"
                                                              class: "form-control-plaintext"
                                                              id: "city"
                                                              'value: "City"
                                                              'readonly: "")))
                            (tr (td (strong "Location: ") (input type: "text"
                                                                 class: "form-control-plaintext"
                                                                 id: "location"
                                                                 'value: "Location"
                                                                 'readonly: "")))
                            (tr (td (strong "Topic: ") (input type: "text"
                                                              class: "form-control-plaintext"
                                                              id: "topic"
                                                              'value: "Topic"
                                                              'readonly: ""))))
                     )
               (p "You will receive an email with your receipt shortly.")
               (br)
               (h4 "Now we need the student's details!")
               (p "Click here to fill out the registration information for your student:")
               (a id: "formUrl"
                  href:"https://docs.google.com/forms/d/e/1FAIpQLSeo6vHe7gyNLl-BLNfOWIGmHyj3tN7Y7WNhsfH49DokINyt5Q/viewform"
                  ;href: "https://docs.google.com/forms/d/e/1FAIpQLSeo6vHe7gyNLl-BLNfOWIGmHyj3tN7Y7WNhsfH49DokINyt5Q/viewform?usp=pp_url&entry.1401296940=Reno,+NV&entry.672430774=University+of+Nevada&entry.1595827644=Awesome+Animals!"
                  class:"btn btn-info"
                  'role: "button"
                  "Finish Enrollment")
               (br)
               @script/inline{
 function setValues(){
  var urlObject = (new URL(window.location.href));
  var cityValue = urlObject.searchParams.get('city');
  var locationValue = urlObject.searchParams.get('location');
  var topicValue = urlObject.searchParams.get('topic');
  document.getElementById('city').value = cityValue;
  document.getElementById('location').value = locationValue;
  document.getElementById('topic').value = topicValue;
  document.getElementById('formUrl').href = 
  'https://docs.google.com/forms/d/e/1FAIpQLSeo6vHe7gyNLl-BLNfOWIGmHyj3tN7Y7WNhsfH49DokINyt5Q/viewform?usp=pp_url&' + 
  '&entry.1401296940=' + encodeURI(cityValue) + 
  '&entry.672430774=' + encodeURI(locationValue) + 
  '&entry.1595827644=' + encodeURI(topicValue);
 }
 setValues();
}
               ))))
