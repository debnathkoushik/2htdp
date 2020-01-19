;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ch1ex49) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;(define y 100)
(define y 200)

;Number -> number
;if the entered number is less than 200 or equal to 200, the conditon returns the entered number which gets deducted from '200'
;and, if the enterd number is more than 200, then the condition returns '0' which gets deducted from '200' and the final answer is also '200'
(- 200 (cond [(> y 200) 0] [else y]))