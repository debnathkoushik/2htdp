;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname keyHandler) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define RADIUS-OF-CIRCLE 20);radius of the ball
(define POSITION-ON-Y 180);position of the ball on y-axis
(define CANVAS-X 400);x-coordinate of the canvas
(define CANVAS-Y 200);y-coordinate of the canvas

;number -> image
;places the image of the ball in the canvas
;according to the current value of x-coordinate
(define (drawImage positionOnX)
  (place-image (circle RADIUS-OF-CIRCLE "solid" "red") positionOnX POSITION-ON-Y
   (empty-scene CANVAS-X CANVAS-Y)))

;number, string -> number
;changes the position of the ball according to the key pressed
(define (keyEvent positionOnX ke)
  (cond
    [(string=? ke "right")
     (+ 1 positionOnX)]
    [(string=? ke "left")
     (sub1 positionOnX)]))

;handles the complete functioning on the canvas
(big-bang 100
  [to-draw drawImage]
  [on-key keyEvent])