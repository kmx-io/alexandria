(in-package :cl-user)

(defpackage :alexandria2-tests
  (:use :cl :alexandria-2 #+sbcl :sb-rt #-sbcl :rtest)
  (:import-from #+sbcl :sb-rt #-sbcl :rtest
                #:*compile-tests* #:*expected-failures*))

(in-package :alexandria2-tests)

(deftest delete-from-plist*.middle
    (let ((input (list 'a 1 'b 2 'c 3 'd 4 'd 5)))
      (multiple-value-list (delete-from-plist* input 'b 'c)))
  ((a 1 d 4 d 5)
   ((c . 3) (b . 2))))

(deftest delete-from-plist*.start
    (let ((input (list 'a 1 'b 2 'c 3 'd 4 'd 5)))
      (multiple-value-list (delete-from-plist* input 'a 'c)))
  ((b 2 d 4 d 5)
   ((c . 3) (a . 1))))

