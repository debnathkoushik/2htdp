;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ch1ex5Boat) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define recLen 40)
(define recBrdth 20)
(define tri1S1 20)
(define tri1A2 90)
(define tri1S3 30)
(define tri2A1 90)
(define tri2S2 20)
(define tri2S3 30)
(define rightTriB 20)
(define rightTriP 30)

(overlay/xy (right-triangle rightTriB rightTriP "solid" "red")
            -50 30 (overlay/xy (triangle/ass tri2A1 tri2S2 tri2S3 "solid" "black") -70 0
            (overlay/xy (triangle/sas tri1S1 tri1A2 tri1S3 "solid" "black")
            30 0 (rectangle recLen recBrdth "solid" "black"))))