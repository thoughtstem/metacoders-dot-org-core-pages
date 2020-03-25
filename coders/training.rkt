#lang at-exp racket

(provide training)

(require metacoders-dot-org-lib)

(define (training)
  (page coders/training.html
   (normal-content-wide
    (mc-jumbotron-header
      #:title "Write!"
      #:tagline "write. write. write. code?"
      #:percent-height "60vh"
      #:image-path "https://picsum.photos/id/1073/5472/3648?grayscale=true")
    (br)

    (container
     (h1 "Wanna write?")
     (h3 "These are the guidelines!!"))

        #;
        (normal-content
          (h1 "Coder Training Starts Here")))))
