
(defun manual-mod (a b)
  (if (< a b)
      a
      (manual-mod (- a b) b)))


(defun gcd-func (a b)
  (if (= b 0)
      a
      (gcd-func b (manual-mod a b))))


(defun lcm-func (a b)
  (if (or (= a 0) (= b 0))
      0
      (/ (* a b) (gcd-func a b))))


(defun rectangle-area (l w)
  (* l w))

(defun rectangle-perimeter (l w)
  (* 2 (+ l w)))

(defun math-main ()
 
  (format t "Enter two numbers for GCD/LCM: ")
  (finish-output)
  (let ((num1 (read)) 
        (num2 (read)))
    (format t "GCD: ~A~%" (gcd-func num1 num2))
    (format t "LCM: ~A~%~%" (lcm-func num1 num2)))


  (format t "--- Rectangle Calculations ---~%")
  (format t "Enter Length and Width: ")
  (finish-output)
  (let ((len (read)) 
        (wid (read)))
    (format t "Area of Rectangle: ~A~%" (rectangle-area len wid))
    (format t "Perimeter of Rectangle: ~A~%" (rectangle-perimeter len wid))))

(math-main)
