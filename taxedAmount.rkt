;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname taxedAmount) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define FIRST-PRICE-RANGE 1000);first price range for which tax needs to be calculated

(define SECOND-PRICE-RANGE 10000);second price range for which tax needs to be calculated

(define NO-TAX-REQUIRED 0);no tax needs to be paid for priceOfItem below Rs.1000

(define FIRST-TAX-PERCENTAGE 0.05);tax percentage for priceOfItem ranging from Rs.1000 to Rs.10000

(define SECOND-TAX-PERCENTAGE 0.08);tax percentage for priceOfItem above Rs.10000

;number -> number
;calculates the amount of tax for various price ranges according to the tax percentage assigned
(define (amountOfTax priceOfItem)
  (cond
   [(< priceOfItem FIRST-PRICE-RANGE) NO-TAX-REQUIRED]
   [(<= FIRST-PRICE-RANGE priceOfItem SECOND-PRICE-RANGE) (* FIRST-TAX-PERCENTAGE priceOfItem)]
   [(> priceOfItem SECOND-PRICE-RANGE) (* SECOND-TAX-PERCENTAGE priceOfItem)]))

;calls the amountOfTax and sends the priceOfItem for which amount of tax needs to be calculated
(amountOfTax 10)