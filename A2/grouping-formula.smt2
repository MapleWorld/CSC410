;; Declaring variables
(declare-const b1 Int)
(declare-const b2 Int)
(declare-const b3 Int)
(declare-const b4 Int)
(declare-const b5 Int)

;; Every student should pair with one of its perferenced student
(assert-soft (or (= b1 2)(= b1 3)(= b1 4)))
(assert-soft (or (= b2 1)(= b2 3)(= b2 5)))
(assert-soft (or (= b3 2)(= b3 1)))
(assert-soft (or (= b4 1)))
(assert-soft (or (= b5 2)))

;; Ensures the remaining student pairs up
(assert (or (= b1 1)(= b1 2)(= b1 3)(= b1 4)(= b1 5)))
(assert (or (= b2 1)(= b2 2)(= b2 3)(= b2 4)(= b2 5)))
(assert (or (= b3 1)(= b3 2)(= b3 3)(= b3 4)(= b3 5)))
(assert (or (= b4 1)(= b4 2)(= b4 3)(= b4 4)(= b4 5)))
(assert (or (= b5 1)(= b5 2)(= b5 3)(= b5 4)(= b5 5)))

;; Ensure there are no duplicate between groups
(assert (or (< b1 b2)(> b2 b1)))
(assert (or (< b1 b3)(> b3 b1)))
(assert (or (< b1 b4)(> b4 b1)))
(assert (or (< b1 b5)(> b5 b1)))
(assert (or (< b2 b1)(> b1 b2)))
(assert (or (< b2 b3)(> b3 b2)))
(assert (or (< b2 b4)(> b4 b2)))
(assert (or (< b2 b5)(> b5 b2)))
(assert (or (< b3 b1)(> b1 b3)))
(assert (or (< b3 b2)(> b2 b3)))
(assert (or (< b3 b4)(> b4 b3)))
(assert (or (< b3 b5)(> b5 b3)))
(assert (or (< b4 b1)(> b1 b4)))
(assert (or (< b4 b2)(> b2 b4)))
(assert (or (< b4 b3)(> b3 b4)))
(assert (or (< b4 b5)(> b5 b4)))
(assert (or (< b5 b1)(> b1 b5)))
(assert (or (< b5 b2)(> b2 b5)))
(assert (or (< b5 b3)(> b3 b5)))
(assert (or (< b5 b4)(> b4 b5)))

;; Ensures each student is in the same group
(assert (or (= b1 1)(and (= b1 2)(= b2 1))(and (= b1 3)(= b3 1))(and (= b1 4)(= b4 1))(and (= b1 5)(= b5 1))))
(assert (or (= b2 2)(and (= b2 1)(= b1 2))(and (= b2 3)(= b3 2))(and (= b2 4)(= b4 2))(and (= b2 5)(= b5 2))))
(assert (or (= b3 3)(and (= b3 1)(= b1 3))(and (= b3 2)(= b2 3))(and (= b3 4)(= b4 3))(and (= b3 5)(= b5 3))))
(assert (or (= b4 4)(and (= b4 1)(= b1 4))(and (= b4 2)(= b2 4))(and (= b4 3)(= b3 4))(and (= b4 5)(= b5 4))))
(assert (or (= b5 5)(and (= b5 1)(= b1 5))(and (= b5 2)(= b2 5))(and (= b5 3)(= b3 5))(and (= b5 4)(= b4 5))))

(check-sat)
(get-model)
