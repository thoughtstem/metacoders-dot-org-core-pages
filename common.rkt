#lang at-exp racket

;work in progress. move all common functions here

(provide gems)

(require website-js
         (except-in metacoders-dot-org-lib script))

(define (gems n) (span n " " (i class:"fas fa-gem")))

(define (display-price price #:suffix [suffix ""])
    (list
      (br)
      (badge-pill-light style: (properties font-size: "12pt")
                        (~p price) suffix)))

(define (stripe-buy-button price num discount sku key)
  (list (button-primary id:(~a "checkout-button-" sku)
                        class: "mt-1 btn-block"
                        style: (properties border-radius: "0 0 0.18rem 0"
                                           white-space: "normal"
                                           )
                        (if (> discount 0)
                          (list (gems num) 
                                (s class: "text-danger"
                                   (display-price price))
                                " " (~p (- price discount))
                          )
                          (list (gems num) 
                                (display-price price)))
        (div id:(~a "error-message" sku))
        ;(script src:"https://js.stripe.com/v3")
        @script/inline{
        (function() {
                    var stripe = Stripe('@key');

                    var checkoutButton = document.getElementById('checkout-button-@sku');
                    checkoutButton.addEventListener('click', function () {

                                                    stripe.redirectToCheckout({
                                                                               items: [{sku: '@sku', quantity: 1}],
                                                                               successUrl: 'https://metacoders.org@(prefix/pathify checkout-success-top-path)',
                                                                               cancelUrl: 'https://metacoders.org@(prefix/pathify checkout-fail-top-path)',
                                                                               billingAddressCollection: 'required',
                                                                               })
                                                    .then(function (result) {
                                                                   if (result.error) {
                                                                   var displayError = document.getElementById('error-message@sku');
                                                                   displayError.textContent = result.error.message;
                                                                   }
                                                                   });
                                                    });
                    })();})
  ))