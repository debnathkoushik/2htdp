;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname UFO) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
 
(define WIDTH 500) 
(define HEIGHT 300)
(define CLOSE (/ HEIGHT 3))
(define MTSCN (empty-scene WIDTH HEIGHT))

(define UFO (underlay/xy (circle 15 "solid" "green") -13 8
(ellipse 55 25 "solid" "green")))

(define (placeUfo currentStateY)
  (place-image UFO (/ WIDTH 2) currentStateY MTSCN))

 
(define (nxtPositionOfUfo currentStateY)
  (+ currentStateY 3))

(define (main initialPositionOfUfo)
  (big-bang initialPositionOfUfo
     [on-tick nxtPositionOfUfo]
     [to-draw placeUfo]))

(main 0)