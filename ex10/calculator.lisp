
(defun manual-add (a b)
  (if (= b 0)
      a
      (manual-add (1+ a) (1- b))))


(defun manual-sub (a b)
  (if (= b 0)
      a
      (manual-sub (1- a) (1- b))))


(defun manual-mul (a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        (t (manual-add a (manual-mul a (1- b))))))


(defun manual-div (a b)
  (cond ((= b 0) "Error: Division by zero")
        ((< a b) 0)
        (t (1+ (manual-div (manual-sub a b) b)))))

(defun calculator ()
  (format t "Enter first number: ")
  (finish-output)
  (let ((a (read)))
    (format t "Enter operator (+ - * /): ")
    (finish-output)
    (let ((op (read)))
      (format t "Enter second number: ")
      (finish-output)
      (let ((b (read)))
        (cond ((eq op '+) (format t "Result: ~A~%" (manual-add a b)))
              ((eq op '-) (format t "Result: ~A~%" (manual-sub a b)))
              ((eq op '*) (format t "Result: ~A~%" (manual-mul a b)))
              ((eq op '/) (format t "Result: ~A~%" (manual-div a b)))
              (t (format t "Invalid operator~%")))))))

(calculator)
