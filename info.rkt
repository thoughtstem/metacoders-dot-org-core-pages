#lang info
(define collection "metacoders-dot-org-core-pages")
(define deps '("base"
               "threading"
               "https://github.com/thoughtstem/metacoders-dot-org.git?path=metacoders-dot-org-lib"
               "https://github.com/thoughtstem/metacoders-dot-org-dc.git?path=metacoders-dot-org-dc-site"
               "https://github.com/thoughtstem/metacoders-dot-org-reno.git?path=metacoders-dot-org-reno-site"
               "https://github.com/thoughtstem/metacoders-dot-org-dallas.git?path=metacoders-dot-org-dallas-site"
               "https://github.com/thoughtstem/metacoders-dot-org-temecula.git?path=metacoders-dot-org-temecula-site"
               "https://github.com/thoughtstem/metacoders-dot-org-minneapolis.git?path=metacoders-dot-org-minneapolis-site"
               "https://github.com/thoughtstem/metacoders-dot-org-poway.git?path=metacoders-dot-org-poway-site"
               "https://github.com/thoughtstem/metacoders-dot-org-chula-vista.git?path=metacoders-dot-org-chula-vista-site"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/metacoders-dot-org-core-pages.scrbl" ())))
(define pkg-desc "Description Here")
(define version "0.0")
(define pkg-authors '(lindseyhandley))
