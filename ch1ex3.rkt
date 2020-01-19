;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ch1ex3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;#lang racket


(define str "helloworld")
(define i 5)

;(define string1(substring str 0 i))
;(define string2(substring str i))

(string-append (substring str 0 i) "_" (substring str i))

