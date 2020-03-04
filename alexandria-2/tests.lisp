(in-package :cl-user)

(defpackage :alexandria2-tests
  (:use :cl :alexandria-2 #+sbcl :sb-rt #-sbcl :rtest)
  (:import-from #+sbcl :sb-rt #-sbcl :rtest
                #:*compile-tests* #:*expected-failures*))

(in-package :alexandria2-tests)

(deftest delete-from-plist*.1
    (let ((orig '(a 1 b 2 c 3 d 4 d 5)))
      (list (m-v-l(delete-from-plist* (copy-list orig) 'a 'c)
            (m-v-l(delete-from-plist* (copy-list orig) 'b 'd)
            (m-v-l(delete-from-plist* (copy-list orig) 'b)
            (m-v-l(delete-from-plist* (copy-list orig) 'a)
            (m-v-l(delete-from-plist* (copy-list orig) 'd 42 "zot")
            (m-v-l(delete-from-plist* (copy-list orig) 'a 'b 'c 'd)
            (m-v-l(delete-from-plist* (copy-list orig) 'a 'b 'c 'd 'x)
            (equal orig (delete-from-plist orig))
            (eq orig (delete-from-plist orig))))
  ((b 2 d 4 d 5)
   (a 1 c 3)
   (a 1 c 3 d 4 d 5)
   (b 2 c 3 d 4 d 5)
   (a 1 b 2 c 3)
   nil
   nil
   t
   t))

