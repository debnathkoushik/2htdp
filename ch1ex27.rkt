;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ch1ex27) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define oriTicketPrice 5.0); In $
(define affectedAttendance 15)
(define changeInTicketPrice 0.10); In $
(define oriAttendance 120)
(define currentTicketPrice 4.90); In $
(define perAttendeeCharge 0.04); In $
(define fixedCost 180); In $

(define (attendance currentTicketPrice)
  (+ oriAttendance (* (- oriTicketPrice currentTicketPrice) (/ affectedAttendance changeInTicketPrice))))

(define (showExpenses currentTicketPrice)
  (+ fixedCost (* perAttendeeCharge (attendance currentTicketPrice))))

(define (totalSale currentTicketPrice)
  (* (attendance currentTicketPrice) currentTicketPrice))

(define (profitEarned currentTicketPrice)
  (- (totalSale currentTicketPrice) (showExpenses currentTicketPrice)))

(profitEarned currentTicketPrice)