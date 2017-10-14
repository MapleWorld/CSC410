(declare-const b1b2 Bool)
(declare-const b1b3 Bool)
(declare-const b1b4 Bool)
(declare-const b2b1 Bool)
(declare-const b2b3 Bool)
(declare-const b2b5 Bool)
(declare-const b3b2 Bool)
(declare-const b3b1 Bool)
(declare-const b4b1 Bool)
(declare-const b5b2 Bool)
;; Every student should pair with one of its perferenced student
(assert-soft (or b1b2 b1b3 b1b4 ))
(assert-soft (or b2b1 b2b3 b2b5 ))
(assert-soft (or b3b2 b3b1 ))
(assert-soft (or b4b1 ))
(assert-soft (or b5b2 ))
;; There shouldn't be duplicate between group
(assert (not (and  b0bb2 b0bb3)))
(assert (not (and  b0bb2 b0bb4)))
(assert (not (and  b0bb3 b0bb4)))
(assert (not (and  b1bb1 b1bb3)))
(assert (not (and  b1bb1 b1bb5)))
(assert (not (and  b1bb3 b1bb5)))
(assert (not (and  b2bb2 b2bb1)))
(check-sat)
(get-model)
