;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ch1ex29) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define oriTicketPrice 5.0); In $
(define affectedAttendance 15)
(define changeInTicketPrice 0.10); In $
(define oriAttendance 120)
(define currentTicketPrice 4); In $
(define perAttendeeCharge 1.50); In $

(define (attendance currentTicketPrice)
  (+ oriAttendance (* (- oriTicketPrice currentTicketPrice) (/ affectedAttendance changeInTicketPrice))))

(define (showExpenses currentTicketPrice)
  (* perAttendeeCharge (attendance currentTicketPrice)))

(define (totalSale currentTicketPrice)
  (* (attendance currentTicketPrice) currentTicketPrice))

(define (profitEarned currentTicketPrice)
  (- (totalSale currentTicketPrice) (showExpenses currentTicketPrice)))

(profitEarned currentTicketPrice)

;At $1 loss is = $360, at $2 profit is = $285, at $3 profit is = $630, at $4 profit is = $675, at $5 profit is = $420