;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ufoTrial) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
 
(define WIDTH 500) 
(define HEIGHT 300)
(define CLOSE (/ HEIGHT 3))
(define MTSCN (empty-scene WIDTH HEIGHT))

(define TEXT-1 "descending");text to be displayed on the screen
(define TEXT-2 "closing in");text to be displayed on the screen
(define TEXT-3 "landed");text to be displayed on the screen
(define FONT-SIZE 25);size of the text
(define FONT-COLOUR "black");colour of the text
(define FONT-FACE "Gill Sans");font family and font face altogether decides the type of text
(define FONT-FAMILY 'swiss);font family and font face altogether decides the type of text 
(define FONT-STYLE 'italic);style of the text i.e. 'normal or 'italic
(define FONT-WEIGHT 'bold);decides whether the text to be displayed will be 'bold or 'normal 
(define FONT-UNDERLINE #false);decides whether the text will have a underline or not


(define UFO (underlay/xy (circle 15 "solid" "green") -13 8
(ellipse 55 25 "solid" "green")))

(define (drawUfo currentStateY)
(cond
[(<= currentStateY (/ HEIGHT 3))
 (place-image (text/font TEXT-1 FONT-SIZE FONT-COLOUR FONT-FACE FONT-FAMILY FONT-STYLE FONT-WEIGHT FONT-UNDERLINE) 250 150
   (place-image UFO (/ WIDTH 2) currentStateY MTSCN))]
[(< (/ HEIGHT 3) currentStateY (- HEIGHT (/ (image-height UFO) 2)))
 (place-image (text/font TEXT-2 FONT-SIZE FONT-COLOUR FONT-FACE FONT-FAMILY FONT-STYLE FONT-WEIGHT FONT-UNDERLINE) 250 150
   (place-image UFO (/ WIDTH 2) currentStateY MTSCN))]
[else (place-image (text/font TEXT-3 FONT-SIZE FONT-COLOUR FONT-FACE FONT-FAMILY FONT-STYLE FONT-WEIGHT FONT-UNDERLINE) 250 150
   (place-image UFO (/ WIDTH 2) (- HEIGHT (/ (image-height UFO) 2)) MTSCN))]
  ))

(define (nxtPositionOfUfo currentStateY)
  (+ currentStateY 3))

(define (end? currentStateY)
(> currentStateY (- HEIGHT (/ (image-height UFO) 2))))

(define (main initialPositionOfUfo)
  (big-bang initialPositionOfUfo
     [on-tick nxtPositionOfUfo]
     [to-draw drawUfo]
     [stop-when end?]))

(main 0)