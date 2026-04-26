
(defun manual-length (str)
  (let ((count 0))
    (loop for char across str do (incf count))
    count))

(defun manual-reverse (str)
  (let ((reversed-str (make-string (manual-length str))))
    (let ((len (manual-length str)))
      (dotimes (i len)
        (setf (char reversed-str (- len 1 i)) (char str i))))
    reversed-str))

(defun manual-string-equal (s1 s2)
  (let ((len1 (manual-length s1))
        (len2 (manual-length s2)))
    (if (/= len1 len2)
        nil ; Not equal if lengths differ
        (let ((is-equal t))
          (dotimes (i len1)
            (unless (char= (char s1 i) (char s2 i))
              (setf is-equal nil)))
          is-equal))))

(defun string-operations ()
  ;; Input for Length and Reverse
  (format t "Enter a string to find its length and reverse: ")
  (finish-output)
  (let ((str1 (read-line)))
    

    (format t "Enter the first string for comparison: ")
    (finish-output)
    (let ((comp1 (read-line)))
      (format t "Enter the second string for comparison: ")
      (finish-output)
      (let ((comp2 (read-line)))

        (format t "~%--- Length & Reverse ---~%")
        (format t "Length: ~A~%" (manual-length str1))
        (format t "Reverse: ~A~%" (manual-reverse str1))


        (format t "~%--- Comparison ---~%")
        (if (manual-string-equal comp1 comp2)
            (format t "Result: The comparison strings are EQUAL~%")
            (format t "Result: The comparison strings are NOT EQUAL~%"))))))

(string-operations)
