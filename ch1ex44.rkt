;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ch1ex44) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;radius of the wheel of the car
(define WHEEL-RADIUS 5)

;distance between both the wheels of the car
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

;initial position of the car in the y-coordinate
(define CURRENT-POSITION-Y 160)

;x-coordinate of the canvas
(define CANVAS-X 800)

;y-coordinate of the canvas
(define CANVAS-Y 200)

;produces the image of the car
(define carImage
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

;places the image of the car in the canvas
(define (positionOfImage currPositionX)
  (place-image carImage currPositionX CURRENT-POSITION-Y (empty-scene CANVAS-X CANVAS-Y)))

;moves the car at the rate of 3 pixels everytime the on-tick funnction calls
(define (changePosition currPositionX)
  (+ 3 currPositionX)
  ;currPositionX
  )

;stops the car
(define (end? currPositionX)
(if (>= currPositionX CANVAS-X) #true #false))
;(>= currPositionX CANVAS-X))

;initialises/changes the position of the car in the x-coordinate of the canvas everytime the user pressses any key
(define (reset currPositionX ke)
  13)

;controls the movement of the car in the canvas
(define (carMovement initialPosition)
  (big-bang initialPosition
    [to-draw positionOfImage]
    [on-tick changePosition]
    [stop-when end?]
    [on-key reset]))

(carMovement 13)