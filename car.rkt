;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname car) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define WIDTH-OF-WORLD 200)

(define WHEEL-RADIUS 20)
 
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define (carImage invalidArg)
  (overlay/xy
 (circle WHEEL-RADIUS "solid" "black")
 (- (* -3.5 WHEEL-RADIUS) WHEEL-DISTANCE)
 (* -3 WHEEL-RADIUS) 
(overlay/xy
 (circle WHEEL-RADIUS "solid" "black")
 (* -3.5 WHEEL-RADIUS)
 (* -3 WHEEL-RADIUS)
 (underlay/xy
  (rectangle (* 3 WHEEL-RADIUS) (* 2 WHEEL-RADIUS) "solid" "red")
  (* 3 WHEEL-RADIUS)
  (* -2 WHEEL-RADIUS)
  (underlay/xy
   (rectangle (* 3 WHEEL-RADIUS) (* 2 WHEEL-RADIUS) "solid" "red")
   (* -8 WHEEL-RADIUS)
   (* -2 WHEEL-RADIUS)
   (rectangle (* 8 WHEEL-RADIUS) (* 4 WHEEL-RADIUS) "solid" "red"))))))

(carImage 1)