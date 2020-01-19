;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname temparatureConvert) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)
(define temparature "212")

(define (convert input output)
  (write-file output (string-append (number->string (* (/ 5 9)
    (- (string->number (read-file input)) 32))) "\n")))

(write-file "input1.txt" temparature)
(convert "input1.txt" 'stdout)

(convert "input1.txt" "output1.txt")
(read-file "output1.txt")