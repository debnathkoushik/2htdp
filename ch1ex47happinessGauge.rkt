;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ch1ex47happinessGauge) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define COMMON-POINT 300);common point on both x-axis and y-axis

(define TEXT "happiness gauge");text to be displayed on the screen
(define FONT-SIZE 25);size of the text
(define FONT-COLOUR "black");colour of the text
(define FONT-FACE "Gill Sans");font family and font face altogether decides the type of text
(define FONT-FAMILY 'swiss);font family and font face altogether decides the type of text 
(define FONT-STYLE 'italic);style of the text i.e. 'normal or 'italic
(define FONT-WEIGHT 'bold);decides whether the text to be displayed will be 'bold or 'normal 
(define FONT-UNDERLINE #false);decides whether the text will have a underline or not

;number -> image
;displays a text on the canvas
;where a rectangle increses/decreases in size as per the current number passed on y-axis
(define (drawImage currentStateY)
  (place-image(text/font TEXT FONT-SIZE FONT-COLOUR FONT-FACE FONT-FAMILY FONT-STYLE FONT-WEIGHT FONT-UNDERLINE) COMMON-POINT COMMON-POINT
    (place-image(rectangle COMMON-POINT currentStateY "solid" "red") COMMON-POINT (- (+ COMMON-POINT 50) (/ currentStateY 2))
      (place-image (rectangle (+ COMMON-POINT 1) (+ (/ COMMON-POINT 3) 1) "outline" "black") COMMON-POINT COMMON-POINT
        (empty-scene (* COMMON-POINT 2) (* COMMON-POINT 2))))))

;number -> number
;decrements the current number by 0.1 at the rate of 28 fps
(define (changeState currentStateY)
  (- currentStateY (* 0.1 currentStateY)))

;number, string -> number
;checks whether up arrow key is pressed or down arrow key is pressed
;and increments accordingly
(define (keyEvent currentStateY ke)
  (cond
    [(string=? ke "up")
     (+ (* 1/3 currentStateY) currentStateY)]
    [(string=? ke "down")
     (+ (* 1/5 currentStateY) currentStateY)]))

;number -> boolean
;ends the execution when the current number falls below '0'
(define (end? currentStateY)
  (if (< currentStateY 0.1) #true #false));here when '0.1' is replaced with '0' the execution doesn't meet expectations as the current number never gets below '0'

;handles the entire functioning
(big-bang 100
  [to-draw drawImage]
  [on-tick changeState]
  [stop-when end?]
  [on-key keyEvent])