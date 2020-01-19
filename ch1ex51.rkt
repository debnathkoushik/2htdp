;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ch1ex51) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define CANVAS-X 200);x-coordinate of the canvas
(define CANVAS-Y 200);y-coordinate of the canvas
(define POSITION-OF-SIGNAL-X 100);position of the circle on x-axis
(define POSITION-OF-SIGNAL-Y 100);position of the circle on y-axis
(define RADIUS-OF-THE-SIGNAL 50);radius of the circle

;number -> colour
;calls the drawLight function to change the colour of the traffic light as per the current number
(define (trafficSignal number)
  (cond
    [(= number 0) (drawLight "red")]
    [(= number 1) (drawLight "yellow")]
    [(= number 2) (drawLight "green")]))

;string -> image
;places the circle on the canvas and changes the colour as per the colour string is passed
(define (drawLight colour)
  (place-image(circle RADIUS-OF-THE-SIGNAL "solid" colour)  POSITION-OF-SIGNAL-X  POSITION-OF-SIGNAL-Y
     (empty-scene CANVAS-X CANVAS-Y)))

;number -> number
;increments the cuurent number and checks whether the current number is more than 2
;when the current number becomes more than 2, it returns 'o' as the current state
(define (changeState currentState)
  (modulo (+ currentState 1) 3))

;handles the complete functioning
(big-bang 0
    [to-draw trafficSignal]
    [on-tick changeState])