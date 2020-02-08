;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname trafficLight) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;x-coordinate of the BACKGROUND
(define CANVAS-X 300)

;y-coordinate of the BACKGROUND
(define CANVAS-Y 100)

;x-coordinate of the trafficLight placed on the BACKGROUND
(define POSITION-X (/ CANVAS-X 2))

;y-coordinate of the trafficLight placed on the BACKGROUND
(define POSITION-Y (/ CANVAS-Y 2))

;the empty space created on the screen where the trafficLight is placed
(define BACKGROUND (empty-scene CANVAS-X CANVAS-Y))

;the speed at which on-tick event handler will change the currentLight
(define RATE-OF-FRAME-CHANGE 1)

;glows the red circle of the trafficLight according to the currentLight passsed to the drawLight
(define RED-LIGHT (overlay/xy (circle 20 "outline" "yellow") (- (- POSITION-X) 5) (/ (- POSITION-Y) 20)
            (overlay/xy (circle 20 "outline" "green") (- 70 POSITION-X) (/ (- POSITION-Y) 20)
                        (overlay/xy (rectangle 200 50 "outline" "black") (/ POSITION-X 30) (/ POSITION-Y 20) (circle 20 "solid" "red")))))

;glows the green circle of the trafficLight according to the currentLight passsed to the drawLight
(define GREEN-LIGHT (overlay/xy (circle 20 "outline" "yellow") (- (- POSITION-X) 5) (/ (- POSITION-Y) 20)
            (overlay/xy (circle 20 "solid" "green") (- 70 POSITION-X) (/ (- POSITION-Y) 20)
                        (overlay/xy (rectangle 200 50 "outline" "black") (/ POSITION-X 30) (/ POSITION-Y 20) (circle 20 "outline" "red")))))

;glows the yellow circle of the trafficLight according to the currentLight passsed to the drawLight
(define YELLOW-LIGHT (overlay/xy (circle 20 "solid" "yellow") (- (- POSITION-X) 5) (/ (- POSITION-Y) 20)
            (overlay/xy (circle 20 "outline" "green") (- 70 POSITION-X) (/ (- POSITION-Y) 20)
                        (overlay/xy (rectangle 200 50 "outline" "black") (/ POSITION-X 30) (/ POSITION-Y 20) (circle 20 "outline" "red")))))

;draws the trafficLight everytime the currentLight is passed
;here the currentLight is in the form of number
(define (drawLight currentLight)
  (cond
    [(= currentLight 0) (place-image RED-LIGHT POSITION-X POSITION-Y BACKGROUND)]
    [(= currentLight 1) (place-image GREEN-LIGHT POSITION-X POSITION-Y BACKGROUND)]
    [(= currentLight 2)(place-image YELLOW-LIGHT POSITION-X POSITION-Y BACKGROUND)]))

;keeps on changing the currentLight everytime the clock ticks(on-tick event handler calls) at the rate of 1 frame per second
;here modulo is used so that the trafficLight glows continously
(define (changeLight currentLight)
  (modulo (+ currentLight 1) 3))

;controls the entire functioning of the trafficLight as soon as initialLight is passed to it
;here the on-tick event handler changes the currentLight at the rate of 1 frame per second
(define (trafficLight initialLight)
  (big-bang initialLight
    [to-draw drawLight]
    [on-tick changeLight RATE-OF-FRAME-CHANGE]))

;passses the initialLight of the trafficLight
(trafficLight 0)