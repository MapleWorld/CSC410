;; Declaring variables
(declare-const m00 Int)
(assert (= m00 8))
(declare-const m01 Int)
(assert (= m01 9))
(declare-const m02 Int)
(assert (= m02 10))
(declare-const m03 Int)
(declare-const m04 Int)
(declare-const m05 Int)
(declare-const m10 Int)
(declare-const m11 Int)
(declare-const m12 Int)
(declare-const m13 Int)
(assert (= m13 13))
(declare-const m14 Int)
(assert (= m14 16))
(declare-const m15 Int)
(declare-const m20 Int)
(declare-const m21 Int)
(assert (= m21 31))
(declare-const m22 Int)
(declare-const m23 Int)
(declare-const m24 Int)
(assert (= m24 14))
(declare-const m25 Int)
(assert (= m25 19))
(declare-const m30 Int)
(declare-const m31 Int)
(declare-const m32 Int)
(declare-const m33 Int)
(assert (= m33 1))
(declare-const m34 Int)
(assert (= m34 22))
(declare-const m35 Int)
(declare-const m40 Int)
(declare-const m41 Int)
(declare-const m42 Int)
(declare-const m43 Int)
(declare-const m44 Int)
(declare-const m45 Int)
;; Ensures all cell are greater than 0
(assert (and (> m00 0) (> m01 0) (> m02 0) (> m03 0) (> m04 0) (> m05 0) (> m10 0) (> m11 0) (> m12 0) (> m13 0) (> m14 0) (> m15 0) (> m20 0) (> m21 0) (> m22 0) (> m23 0) (> m24 0) (> m25 0) (> m30 0) (> m31 0) (> m32 0) (> m33 0) (> m34 0) (> m35 0) (> m40 0) (> m41 0) (> m42 0) (> m43 0) (> m44 0) (> m45 0) ))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m02 (+ m03 1)) (>= m02 (+ m03 1)))(and (<= m04 (+ m03 1)) (>= m04 (+ m03 1)))(and (<= m12 (+ m03 1)) (>= m12 (+ m03 1)))(and (<= m13 (+ m03 1)) (>= m13 (+ m03 1)))(and (<= m14 (+ m03 1)) (>= m14 (+ m03 1)))))
(assert (or (and (<= m02 (- m03 1)) (>= m02 (- m03 1)))(and (<= m04 (- m03 1)) (>= m04 (- m03 1)))(and (<= m12 (- m03 1)) (>= m12 (- m03 1)))(and (<= m13 (- m03 1)) (>= m13 (- m03 1)))(and (<= m14 (- m03 1)) (>= m14 (- m03 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m03 (+ m04 1)) (>= m03 (+ m04 1)))(and (<= m05 (+ m04 1)) (>= m05 (+ m04 1)))(and (<= m13 (+ m04 1)) (>= m13 (+ m04 1)))(and (<= m14 (+ m04 1)) (>= m14 (+ m04 1)))(and (<= m15 (+ m04 1)) (>= m15 (+ m04 1)))))
(assert (or (and (<= m03 (- m04 1)) (>= m03 (- m04 1)))(and (<= m05 (- m04 1)) (>= m05 (- m04 1)))(and (<= m13 (- m04 1)) (>= m13 (- m04 1)))(and (<= m14 (- m04 1)) (>= m14 (- m04 1)))(and (<= m15 (- m04 1)) (>= m15 (- m04 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m04 (+ m05 1)) (>= m04 (+ m05 1)))(and (<= m14 (+ m05 1)) (>= m14 (+ m05 1)))(and (<= m15 (+ m05 1)) (>= m15 (+ m05 1)))))
(assert (or (and (<= m04 (- m05 1)) (>= m04 (- m05 1)))(and (<= m14 (- m05 1)) (>= m14 (- m05 1)))(and (<= m15 (- m05 1)) (>= m15 (- m05 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m00 (+ m10 1)) (>= m00 (+ m10 1)))(and (<= m01 (+ m10 1)) (>= m01 (+ m10 1)))(and (<= m11 (+ m10 1)) (>= m11 (+ m10 1)))(and (<= m20 (+ m10 1)) (>= m20 (+ m10 1)))(and (<= m21 (+ m10 1)) (>= m21 (+ m10 1)))))
(assert (or (and (<= m00 (- m10 1)) (>= m00 (- m10 1)))(and (<= m01 (- m10 1)) (>= m01 (- m10 1)))(and (<= m11 (- m10 1)) (>= m11 (- m10 1)))(and (<= m20 (- m10 1)) (>= m20 (- m10 1)))(and (<= m21 (- m10 1)) (>= m21 (- m10 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m00 (+ m11 1)) (>= m00 (+ m11 1)))(and (<= m01 (+ m11 1)) (>= m01 (+ m11 1)))(and (<= m02 (+ m11 1)) (>= m02 (+ m11 1)))(and (<= m10 (+ m11 1)) (>= m10 (+ m11 1)))(and (<= m12 (+ m11 1)) (>= m12 (+ m11 1)))(and (<= m20 (+ m11 1)) (>= m20 (+ m11 1)))(and (<= m21 (+ m11 1)) (>= m21 (+ m11 1)))(and (<= m22 (+ m11 1)) (>= m22 (+ m11 1)))))
(assert (or (and (<= m00 (- m11 1)) (>= m00 (- m11 1)))(and (<= m01 (- m11 1)) (>= m01 (- m11 1)))(and (<= m02 (- m11 1)) (>= m02 (- m11 1)))(and (<= m10 (- m11 1)) (>= m10 (- m11 1)))(and (<= m12 (- m11 1)) (>= m12 (- m11 1)))(and (<= m20 (- m11 1)) (>= m20 (- m11 1)))(and (<= m21 (- m11 1)) (>= m21 (- m11 1)))(and (<= m22 (- m11 1)) (>= m22 (- m11 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m01 (+ m12 1)) (>= m01 (+ m12 1)))(and (<= m02 (+ m12 1)) (>= m02 (+ m12 1)))(and (<= m03 (+ m12 1)) (>= m03 (+ m12 1)))(and (<= m11 (+ m12 1)) (>= m11 (+ m12 1)))(and (<= m13 (+ m12 1)) (>= m13 (+ m12 1)))(and (<= m21 (+ m12 1)) (>= m21 (+ m12 1)))(and (<= m22 (+ m12 1)) (>= m22 (+ m12 1)))(and (<= m23 (+ m12 1)) (>= m23 (+ m12 1)))))
(assert (or (and (<= m01 (- m12 1)) (>= m01 (- m12 1)))(and (<= m02 (- m12 1)) (>= m02 (- m12 1)))(and (<= m03 (- m12 1)) (>= m03 (- m12 1)))(and (<= m11 (- m12 1)) (>= m11 (- m12 1)))(and (<= m13 (- m12 1)) (>= m13 (- m12 1)))(and (<= m21 (- m12 1)) (>= m21 (- m12 1)))(and (<= m22 (- m12 1)) (>= m22 (- m12 1)))(and (<= m23 (- m12 1)) (>= m23 (- m12 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m04 (+ m15 1)) (>= m04 (+ m15 1)))(and (<= m05 (+ m15 1)) (>= m05 (+ m15 1)))(and (<= m14 (+ m15 1)) (>= m14 (+ m15 1)))(and (<= m24 (+ m15 1)) (>= m24 (+ m15 1)))(and (<= m25 (+ m15 1)) (>= m25 (+ m15 1)))))
(assert (or (and (<= m04 (- m15 1)) (>= m04 (- m15 1)))(and (<= m05 (- m15 1)) (>= m05 (- m15 1)))(and (<= m14 (- m15 1)) (>= m14 (- m15 1)))(and (<= m24 (- m15 1)) (>= m24 (- m15 1)))(and (<= m25 (- m15 1)) (>= m25 (- m15 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m10 (+ m20 1)) (>= m10 (+ m20 1)))(and (<= m11 (+ m20 1)) (>= m11 (+ m20 1)))(and (<= m21 (+ m20 1)) (>= m21 (+ m20 1)))(and (<= m30 (+ m20 1)) (>= m30 (+ m20 1)))(and (<= m31 (+ m20 1)) (>= m31 (+ m20 1)))))
(assert (or (and (<= m10 (- m20 1)) (>= m10 (- m20 1)))(and (<= m11 (- m20 1)) (>= m11 (- m20 1)))(and (<= m21 (- m20 1)) (>= m21 (- m20 1)))(and (<= m30 (- m20 1)) (>= m30 (- m20 1)))(and (<= m31 (- m20 1)) (>= m31 (- m20 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m11 (+ m22 1)) (>= m11 (+ m22 1)))(and (<= m12 (+ m22 1)) (>= m12 (+ m22 1)))(and (<= m13 (+ m22 1)) (>= m13 (+ m22 1)))(and (<= m21 (+ m22 1)) (>= m21 (+ m22 1)))(and (<= m23 (+ m22 1)) (>= m23 (+ m22 1)))(and (<= m31 (+ m22 1)) (>= m31 (+ m22 1)))(and (<= m32 (+ m22 1)) (>= m32 (+ m22 1)))(and (<= m33 (+ m22 1)) (>= m33 (+ m22 1)))))
(assert (or (and (<= m11 (- m22 1)) (>= m11 (- m22 1)))(and (<= m12 (- m22 1)) (>= m12 (- m22 1)))(and (<= m13 (- m22 1)) (>= m13 (- m22 1)))(and (<= m21 (- m22 1)) (>= m21 (- m22 1)))(and (<= m23 (- m22 1)) (>= m23 (- m22 1)))(and (<= m31 (- m22 1)) (>= m31 (- m22 1)))(and (<= m32 (- m22 1)) (>= m32 (- m22 1)))(and (<= m33 (- m22 1)) (>= m33 (- m22 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m12 (+ m23 1)) (>= m12 (+ m23 1)))(and (<= m13 (+ m23 1)) (>= m13 (+ m23 1)))(and (<= m14 (+ m23 1)) (>= m14 (+ m23 1)))(and (<= m22 (+ m23 1)) (>= m22 (+ m23 1)))(and (<= m24 (+ m23 1)) (>= m24 (+ m23 1)))(and (<= m32 (+ m23 1)) (>= m32 (+ m23 1)))(and (<= m33 (+ m23 1)) (>= m33 (+ m23 1)))(and (<= m34 (+ m23 1)) (>= m34 (+ m23 1)))))
(assert (or (and (<= m12 (- m23 1)) (>= m12 (- m23 1)))(and (<= m13 (- m23 1)) (>= m13 (- m23 1)))(and (<= m14 (- m23 1)) (>= m14 (- m23 1)))(and (<= m22 (- m23 1)) (>= m22 (- m23 1)))(and (<= m24 (- m23 1)) (>= m24 (- m23 1)))(and (<= m32 (- m23 1)) (>= m32 (- m23 1)))(and (<= m33 (- m23 1)) (>= m33 (- m23 1)))(and (<= m34 (- m23 1)) (>= m34 (- m23 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m20 (+ m30 1)) (>= m20 (+ m30 1)))(and (<= m21 (+ m30 1)) (>= m21 (+ m30 1)))(and (<= m31 (+ m30 1)) (>= m31 (+ m30 1)))(and (<= m40 (+ m30 1)) (>= m40 (+ m30 1)))(and (<= m41 (+ m30 1)) (>= m41 (+ m30 1)))))
(assert (or (and (<= m20 (- m30 1)) (>= m20 (- m30 1)))(and (<= m21 (- m30 1)) (>= m21 (- m30 1)))(and (<= m31 (- m30 1)) (>= m31 (- m30 1)))(and (<= m40 (- m30 1)) (>= m40 (- m30 1)))(and (<= m41 (- m30 1)) (>= m41 (- m30 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m20 (+ m31 1)) (>= m20 (+ m31 1)))(and (<= m21 (+ m31 1)) (>= m21 (+ m31 1)))(and (<= m22 (+ m31 1)) (>= m22 (+ m31 1)))(and (<= m30 (+ m31 1)) (>= m30 (+ m31 1)))(and (<= m32 (+ m31 1)) (>= m32 (+ m31 1)))(and (<= m40 (+ m31 1)) (>= m40 (+ m31 1)))(and (<= m41 (+ m31 1)) (>= m41 (+ m31 1)))(and (<= m42 (+ m31 1)) (>= m42 (+ m31 1)))))
(assert (or (and (<= m20 (- m31 1)) (>= m20 (- m31 1)))(and (<= m21 (- m31 1)) (>= m21 (- m31 1)))(and (<= m22 (- m31 1)) (>= m22 (- m31 1)))(and (<= m30 (- m31 1)) (>= m30 (- m31 1)))(and (<= m32 (- m31 1)) (>= m32 (- m31 1)))(and (<= m40 (- m31 1)) (>= m40 (- m31 1)))(and (<= m41 (- m31 1)) (>= m41 (- m31 1)))(and (<= m42 (- m31 1)) (>= m42 (- m31 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m21 (+ m32 1)) (>= m21 (+ m32 1)))(and (<= m22 (+ m32 1)) (>= m22 (+ m32 1)))(and (<= m23 (+ m32 1)) (>= m23 (+ m32 1)))(and (<= m31 (+ m32 1)) (>= m31 (+ m32 1)))(and (<= m33 (+ m32 1)) (>= m33 (+ m32 1)))(and (<= m41 (+ m32 1)) (>= m41 (+ m32 1)))(and (<= m42 (+ m32 1)) (>= m42 (+ m32 1)))(and (<= m43 (+ m32 1)) (>= m43 (+ m32 1)))))
(assert (or (and (<= m21 (- m32 1)) (>= m21 (- m32 1)))(and (<= m22 (- m32 1)) (>= m22 (- m32 1)))(and (<= m23 (- m32 1)) (>= m23 (- m32 1)))(and (<= m31 (- m32 1)) (>= m31 (- m32 1)))(and (<= m33 (- m32 1)) (>= m33 (- m32 1)))(and (<= m41 (- m32 1)) (>= m41 (- m32 1)))(and (<= m42 (- m32 1)) (>= m42 (- m32 1)))(and (<= m43 (- m32 1)) (>= m43 (- m32 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m24 (+ m35 1)) (>= m24 (+ m35 1)))(and (<= m25 (+ m35 1)) (>= m25 (+ m35 1)))(and (<= m34 (+ m35 1)) (>= m34 (+ m35 1)))(and (<= m44 (+ m35 1)) (>= m44 (+ m35 1)))(and (<= m45 (+ m35 1)) (>= m45 (+ m35 1)))))
(assert (or (and (<= m24 (- m35 1)) (>= m24 (- m35 1)))(and (<= m25 (- m35 1)) (>= m25 (- m35 1)))(and (<= m34 (- m35 1)) (>= m34 (- m35 1)))(and (<= m44 (- m35 1)) (>= m44 (- m35 1)))(and (<= m45 (- m35 1)) (>= m45 (- m35 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m30 (+ m40 1)) (>= m30 (+ m40 1)))(and (<= m31 (+ m40 1)) (>= m31 (+ m40 1)))(and (<= m41 (+ m40 1)) (>= m41 (+ m40 1)))))
(assert (or (and (<= m30 (- m40 1)) (>= m30 (- m40 1)))(and (<= m31 (- m40 1)) (>= m31 (- m40 1)))(and (<= m41 (- m40 1)) (>= m41 (- m40 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m30 (+ m41 1)) (>= m30 (+ m41 1)))(and (<= m31 (+ m41 1)) (>= m31 (+ m41 1)))(and (<= m32 (+ m41 1)) (>= m32 (+ m41 1)))(and (<= m40 (+ m41 1)) (>= m40 (+ m41 1)))(and (<= m42 (+ m41 1)) (>= m42 (+ m41 1)))))
(assert (or (and (<= m30 (- m41 1)) (>= m30 (- m41 1)))(and (<= m31 (- m41 1)) (>= m31 (- m41 1)))(and (<= m32 (- m41 1)) (>= m32 (- m41 1)))(and (<= m40 (- m41 1)) (>= m40 (- m41 1)))(and (<= m42 (- m41 1)) (>= m42 (- m41 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m31 (+ m42 1)) (>= m31 (+ m42 1)))(and (<= m32 (+ m42 1)) (>= m32 (+ m42 1)))(and (<= m33 (+ m42 1)) (>= m33 (+ m42 1)))(and (<= m41 (+ m42 1)) (>= m41 (+ m42 1)))(and (<= m43 (+ m42 1)) (>= m43 (+ m42 1)))))
(assert (or (and (<= m31 (- m42 1)) (>= m31 (- m42 1)))(and (<= m32 (- m42 1)) (>= m32 (- m42 1)))(and (<= m33 (- m42 1)) (>= m33 (- m42 1)))(and (<= m41 (- m42 1)) (>= m41 (- m42 1)))(and (<= m43 (- m42 1)) (>= m43 (- m42 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m32 (+ m43 1)) (>= m32 (+ m43 1)))(and (<= m33 (+ m43 1)) (>= m33 (+ m43 1)))(and (<= m34 (+ m43 1)) (>= m34 (+ m43 1)))(and (<= m42 (+ m43 1)) (>= m42 (+ m43 1)))(and (<= m44 (+ m43 1)) (>= m44 (+ m43 1)))))
(assert (or (and (<= m32 (- m43 1)) (>= m32 (- m43 1)))(and (<= m33 (- m43 1)) (>= m33 (- m43 1)))(and (<= m34 (- m43 1)) (>= m34 (- m43 1)))(and (<= m42 (- m43 1)) (>= m42 (- m43 1)))(and (<= m44 (- m43 1)) (>= m44 (- m43 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m33 (+ m44 1)) (>= m33 (+ m44 1)))(and (<= m34 (+ m44 1)) (>= m34 (+ m44 1)))(and (<= m35 (+ m44 1)) (>= m35 (+ m44 1)))(and (<= m43 (+ m44 1)) (>= m43 (+ m44 1)))(and (<= m45 (+ m44 1)) (>= m45 (+ m44 1)))))
(assert (or (and (<= m33 (- m44 1)) (>= m33 (- m44 1)))(and (<= m34 (- m44 1)) (>= m34 (- m44 1)))(and (<= m35 (- m44 1)) (>= m35 (- m44 1)))(and (<= m43 (- m44 1)) (>= m43 (- m44 1)))(and (<= m45 (- m44 1)) (>= m45 (- m44 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m34 (+ m45 1)) (>= m34 (+ m45 1)))(and (<= m35 (+ m45 1)) (>= m35 (+ m45 1)))(and (<= m44 (+ m45 1)) (>= m44 (+ m45 1)))))
(assert (or (and (<= m34 (- m45 1)) (>= m34 (- m45 1)))(and (<= m35 (- m45 1)) (>= m35 (- m45 1)))(and (<= m44 (- m45 1)) (>= m44 (- m45 1)))))
;; Ensures that there is no duplicate values
(assert (and (not (= m00 m11))(not (= m00 m10))(not (= m00 m13))(not (= m00 m12))(not (= m00 m15))(not (= m00 m14))(not (= m00 m45))(not (= m00 m44))(not (= m00 m35))(not (= m00 m34))(not (= m00 m33))(not (= m00 m32))(not (= m00 m31))(not (= m00 m30))(not (= m00 m04))(not (= m00 m05))(not (= m00 m02))(not (= m00 m03))(not (= m00 m01))(not (= m00 m24))(not (= m00 m25))(not (= m00 m40))(not (= m00 m41))(not (= m00 m20))(not (= m00 m21))(not (= m00 m22))(not (= m00 m23))(not (= m00 m42))(not (= m00 m43))))
(assert (and (not (= m01 m11))(not (= m01 m10))(not (= m01 m13))(not (= m01 m12))(not (= m01 m15))(not (= m01 m14))(not (= m01 m45))(not (= m01 m44))(not (= m01 m35))(not (= m01 m34))(not (= m01 m33))(not (= m01 m32))(not (= m01 m31))(not (= m01 m30))(not (= m01 m04))(not (= m01 m05))(not (= m01 m02))(not (= m01 m03))(not (= m01 m24))(not (= m01 m25))(not (= m01 m40))(not (= m01 m41))(not (= m01 m20))(not (= m01 m21))(not (= m01 m22))(not (= m01 m23))(not (= m01 m42))(not (= m01 m43))))
(assert (and (not (= m02 m11))(not (= m02 m10))(not (= m02 m13))(not (= m02 m12))(not (= m02 m15))(not (= m02 m14))(not (= m02 m45))(not (= m02 m44))(not (= m02 m35))(not (= m02 m34))(not (= m02 m33))(not (= m02 m32))(not (= m02 m31))(not (= m02 m30))(not (= m02 m04))(not (= m02 m05))(not (= m02 m03))(not (= m02 m24))(not (= m02 m25))(not (= m02 m40))(not (= m02 m41))(not (= m02 m20))(not (= m02 m21))(not (= m02 m22))(not (= m02 m23))(not (= m02 m42))(not (= m02 m43))))
(assert (and (not (= m03 m11))(not (= m03 m10))(not (= m03 m13))(not (= m03 m12))(not (= m03 m15))(not (= m03 m14))(not (= m03 m45))(not (= m03 m44))(not (= m03 m35))(not (= m03 m34))(not (= m03 m33))(not (= m03 m32))(not (= m03 m31))(not (= m03 m30))(not (= m03 m04))(not (= m03 m05))(not (= m03 m24))(not (= m03 m25))(not (= m03 m40))(not (= m03 m41))(not (= m03 m20))(not (= m03 m21))(not (= m03 m22))(not (= m03 m23))(not (= m03 m42))(not (= m03 m43))))
(assert (and (not (= m04 m11))(not (= m04 m10))(not (= m04 m13))(not (= m04 m12))(not (= m04 m15))(not (= m04 m14))(not (= m04 m45))(not (= m04 m44))(not (= m04 m35))(not (= m04 m34))(not (= m04 m33))(not (= m04 m32))(not (= m04 m31))(not (= m04 m30))(not (= m04 m05))(not (= m04 m24))(not (= m04 m25))(not (= m04 m40))(not (= m04 m41))(not (= m04 m20))(not (= m04 m21))(not (= m04 m22))(not (= m04 m23))(not (= m04 m42))(not (= m04 m43))))
(assert (and (not (= m05 m11))(not (= m05 m10))(not (= m05 m13))(not (= m05 m12))(not (= m05 m15))(not (= m05 m14))(not (= m05 m45))(not (= m05 m44))(not (= m05 m35))(not (= m05 m34))(not (= m05 m33))(not (= m05 m32))(not (= m05 m31))(not (= m05 m30))(not (= m05 m24))(not (= m05 m25))(not (= m05 m40))(not (= m05 m41))(not (= m05 m20))(not (= m05 m21))(not (= m05 m22))(not (= m05 m23))(not (= m05 m42))(not (= m05 m43))))
(assert (and (not (= m10 m11))(not (= m10 m13))(not (= m10 m12))(not (= m10 m15))(not (= m10 m14))(not (= m10 m45))(not (= m10 m44))(not (= m10 m35))(not (= m10 m34))(not (= m10 m33))(not (= m10 m32))(not (= m10 m31))(not (= m10 m30))(not (= m10 m24))(not (= m10 m25))(not (= m10 m40))(not (= m10 m41))(not (= m10 m20))(not (= m10 m21))(not (= m10 m22))(not (= m10 m23))(not (= m10 m42))(not (= m10 m43))))
(assert (and (not (= m11 m13))(not (= m11 m12))(not (= m11 m15))(not (= m11 m14))(not (= m11 m45))(not (= m11 m44))(not (= m11 m35))(not (= m11 m34))(not (= m11 m33))(not (= m11 m32))(not (= m11 m31))(not (= m11 m30))(not (= m11 m24))(not (= m11 m25))(not (= m11 m40))(not (= m11 m41))(not (= m11 m20))(not (= m11 m21))(not (= m11 m22))(not (= m11 m23))(not (= m11 m42))(not (= m11 m43))))
(assert (and (not (= m12 m13))(not (= m12 m15))(not (= m12 m14))(not (= m12 m45))(not (= m12 m44))(not (= m12 m35))(not (= m12 m34))(not (= m12 m33))(not (= m12 m32))(not (= m12 m31))(not (= m12 m30))(not (= m12 m24))(not (= m12 m25))(not (= m12 m40))(not (= m12 m41))(not (= m12 m20))(not (= m12 m21))(not (= m12 m22))(not (= m12 m23))(not (= m12 m42))(not (= m12 m43))))
(assert (and (not (= m13 m15))(not (= m13 m14))(not (= m13 m45))(not (= m13 m44))(not (= m13 m35))(not (= m13 m34))(not (= m13 m33))(not (= m13 m32))(not (= m13 m31))(not (= m13 m30))(not (= m13 m24))(not (= m13 m25))(not (= m13 m40))(not (= m13 m41))(not (= m13 m20))(not (= m13 m21))(not (= m13 m22))(not (= m13 m23))(not (= m13 m42))(not (= m13 m43))))
(assert (and (not (= m14 m15))(not (= m14 m45))(not (= m14 m44))(not (= m14 m35))(not (= m14 m34))(not (= m14 m33))(not (= m14 m32))(not (= m14 m31))(not (= m14 m30))(not (= m14 m24))(not (= m14 m25))(not (= m14 m40))(not (= m14 m41))(not (= m14 m20))(not (= m14 m21))(not (= m14 m22))(not (= m14 m23))(not (= m14 m42))(not (= m14 m43))))
(assert (and (not (= m15 m45))(not (= m15 m44))(not (= m15 m35))(not (= m15 m34))(not (= m15 m33))(not (= m15 m32))(not (= m15 m31))(not (= m15 m30))(not (= m15 m24))(not (= m15 m25))(not (= m15 m40))(not (= m15 m41))(not (= m15 m20))(not (= m15 m21))(not (= m15 m22))(not (= m15 m23))(not (= m15 m42))(not (= m15 m43))))
(assert (and (not (= m20 m45))(not (= m20 m44))(not (= m20 m35))(not (= m20 m34))(not (= m20 m33))(not (= m20 m32))(not (= m20 m31))(not (= m20 m30))(not (= m20 m24))(not (= m20 m25))(not (= m20 m40))(not (= m20 m41))(not (= m20 m21))(not (= m20 m22))(not (= m20 m23))(not (= m20 m42))(not (= m20 m43))))
(assert (and (not (= m21 m45))(not (= m21 m44))(not (= m21 m35))(not (= m21 m34))(not (= m21 m33))(not (= m21 m32))(not (= m21 m31))(not (= m21 m30))(not (= m21 m24))(not (= m21 m25))(not (= m21 m40))(not (= m21 m41))(not (= m21 m22))(not (= m21 m23))(not (= m21 m42))(not (= m21 m43))))
(assert (and (not (= m22 m45))(not (= m22 m44))(not (= m22 m35))(not (= m22 m34))(not (= m22 m33))(not (= m22 m32))(not (= m22 m31))(not (= m22 m30))(not (= m22 m24))(not (= m22 m25))(not (= m22 m40))(not (= m22 m41))(not (= m22 m23))(not (= m22 m42))(not (= m22 m43))))
(assert (and (not (= m23 m45))(not (= m23 m44))(not (= m23 m35))(not (= m23 m34))(not (= m23 m33))(not (= m23 m32))(not (= m23 m31))(not (= m23 m30))(not (= m23 m24))(not (= m23 m25))(not (= m23 m40))(not (= m23 m41))(not (= m23 m42))(not (= m23 m43))))
(assert (and (not (= m24 m45))(not (= m24 m44))(not (= m24 m35))(not (= m24 m34))(not (= m24 m33))(not (= m24 m32))(not (= m24 m31))(not (= m24 m30))(not (= m24 m25))(not (= m24 m40))(not (= m24 m41))(not (= m24 m42))(not (= m24 m43))))
(assert (and (not (= m25 m45))(not (= m25 m44))(not (= m25 m35))(not (= m25 m34))(not (= m25 m33))(not (= m25 m32))(not (= m25 m31))(not (= m25 m30))(not (= m25 m40))(not (= m25 m41))(not (= m25 m42))(not (= m25 m43))))
(assert (and (not (= m30 m45))(not (= m30 m44))(not (= m30 m35))(not (= m30 m34))(not (= m30 m33))(not (= m30 m32))(not (= m30 m31))(not (= m30 m40))(not (= m30 m41))(not (= m30 m42))(not (= m30 m43))))
(assert (and (not (= m31 m45))(not (= m31 m44))(not (= m31 m35))(not (= m31 m34))(not (= m31 m33))(not (= m31 m32))(not (= m31 m40))(not (= m31 m41))(not (= m31 m42))(not (= m31 m43))))
(assert (and (not (= m32 m45))(not (= m32 m44))(not (= m32 m35))(not (= m32 m34))(not (= m32 m33))(not (= m32 m40))(not (= m32 m41))(not (= m32 m42))(not (= m32 m43))))
(assert (and (not (= m33 m45))(not (= m33 m44))(not (= m33 m35))(not (= m33 m34))(not (= m33 m40))(not (= m33 m41))(not (= m33 m42))(not (= m33 m43))))
(assert (and (not (= m34 m45))(not (= m34 m44))(not (= m34 m35))(not (= m34 m40))(not (= m34 m41))(not (= m34 m42))(not (= m34 m43))))
(assert (and (not (= m35 m45))(not (= m35 m44))(not (= m35 m40))(not (= m35 m41))(not (= m35 m42))(not (= m35 m43))))
(assert (and (not (= m40 m45))(not (= m40 m44))(not (= m40 m41))(not (= m40 m42))(not (= m40 m43))))
(assert (and (not (= m41 m45))(not (= m41 m44))(not (= m41 m42))(not (= m41 m43))))
(assert (and (not (= m42 m45))(not (= m42 m44))(not (= m42 m43))))
(assert (and (not (= m43 m45))(not (= m43 m44))))
(assert (and (not (= m44 m45))))
(check-sat)
(get-model)
