;; Declaring variables
(declare-const m02 Int)
(assert (= m02 7))
(declare-const m03 Int)
(assert (= m03 6))
(declare-const m04 Int)
(declare-const m12 Int)
(assert (= m12 5))
(declare-const m13 Int)
(declare-const m14 Int)
(declare-const m20 Int)
(assert (= m20 31))
(declare-const m21 Int)
(declare-const m22 Int)
(declare-const m23 Int)
(assert (= m23 4))
(declare-const m24 Int)
(declare-const m25 Int)
(declare-const m26 Int)
(assert (= m26 18))
(declare-const m30 Int)
(declare-const m31 Int)
(assert (= m31 33))
(declare-const m32 Int)
(assert (= m32 2))
(declare-const m33 Int)
(assert (= m33 12))
(declare-const m34 Int)
(assert (= m34 15))
(declare-const m35 Int)
(assert (= m35 19))
(declare-const m36 Int)
(declare-const m40 Int)
(assert (= m40 29))
(declare-const m41 Int)
(assert (= m41 28))
(declare-const m42 Int)
(assert (= m42 1))
(declare-const m43 Int)
(assert (= m43 14))
(declare-const m44 Int)
(declare-const m45 Int)
(declare-const m46 Int)
(declare-const m52 Int)
(declare-const m53 Int)
(assert (= m53 24))
(declare-const m54 Int)
(assert (= m54 22))
(declare-const m62 Int)
(assert (= m62 25))
(declare-const m63 Int)
(declare-const m64 Int)
;; Ensures all cell are greater than 0
(assert (and (> m02 0) (> m03 0) (> m04 0) (> m12 0) (> m13 0) (> m14 0) (> m20 0) (> m21 0) (> m22 0) (> m23 0) (> m24 0) (> m25 0) (> m26 0) (> m30 0) (> m31 0) (> m32 0) (> m33 0) (> m34 0) (> m35 0) (> m36 0) (> m40 0) (> m41 0) (> m42 0) (> m43 0) (> m44 0) (> m45 0) (> m46 0) (> m52 0) (> m53 0) (> m54 0) (> m62 0) (> m63 0) (> m64 0) ))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m03 (+ m04 1)) (>= m03 (+ m04 1)))(and (<= m13 (+ m04 1)) (>= m13 (+ m04 1)))(and (<= m14 (+ m04 1)) (>= m14 (+ m04 1)))))
(assert (or (and (<= m03 (- m04 1)) (>= m03 (- m04 1)))(and (<= m13 (- m04 1)) (>= m13 (- m04 1)))(and (<= m14 (- m04 1)) (>= m14 (- m04 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m02 (+ m13 1)) (>= m02 (+ m13 1)))(and (<= m03 (+ m13 1)) (>= m03 (+ m13 1)))(and (<= m04 (+ m13 1)) (>= m04 (+ m13 1)))(and (<= m12 (+ m13 1)) (>= m12 (+ m13 1)))(and (<= m14 (+ m13 1)) (>= m14 (+ m13 1)))(and (<= m22 (+ m13 1)) (>= m22 (+ m13 1)))(and (<= m23 (+ m13 1)) (>= m23 (+ m13 1)))(and (<= m24 (+ m13 1)) (>= m24 (+ m13 1)))))
(assert (or (and (<= m02 (- m13 1)) (>= m02 (- m13 1)))(and (<= m03 (- m13 1)) (>= m03 (- m13 1)))(and (<= m04 (- m13 1)) (>= m04 (- m13 1)))(and (<= m12 (- m13 1)) (>= m12 (- m13 1)))(and (<= m14 (- m13 1)) (>= m14 (- m13 1)))(and (<= m22 (- m13 1)) (>= m22 (- m13 1)))(and (<= m23 (- m13 1)) (>= m23 (- m13 1)))(and (<= m24 (- m13 1)) (>= m24 (- m13 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m03 (+ m14 1)) (>= m03 (+ m14 1)))(and (<= m04 (+ m14 1)) (>= m04 (+ m14 1)))(and (<= m13 (+ m14 1)) (>= m13 (+ m14 1)))(and (<= m23 (+ m14 1)) (>= m23 (+ m14 1)))(and (<= m24 (+ m14 1)) (>= m24 (+ m14 1)))(and (<= m25 (+ m14 1)) (>= m25 (+ m14 1)))))
(assert (or (and (<= m03 (- m14 1)) (>= m03 (- m14 1)))(and (<= m04 (- m14 1)) (>= m04 (- m14 1)))(and (<= m13 (- m14 1)) (>= m13 (- m14 1)))(and (<= m23 (- m14 1)) (>= m23 (- m14 1)))(and (<= m24 (- m14 1)) (>= m24 (- m14 1)))(and (<= m25 (- m14 1)) (>= m25 (- m14 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m12 (+ m21 1)) (>= m12 (+ m21 1)))(and (<= m20 (+ m21 1)) (>= m20 (+ m21 1)))(and (<= m22 (+ m21 1)) (>= m22 (+ m21 1)))(and (<= m30 (+ m21 1)) (>= m30 (+ m21 1)))(and (<= m31 (+ m21 1)) (>= m31 (+ m21 1)))(and (<= m32 (+ m21 1)) (>= m32 (+ m21 1)))))
(assert (or (and (<= m12 (- m21 1)) (>= m12 (- m21 1)))(and (<= m20 (- m21 1)) (>= m20 (- m21 1)))(and (<= m22 (- m21 1)) (>= m22 (- m21 1)))(and (<= m30 (- m21 1)) (>= m30 (- m21 1)))(and (<= m31 (- m21 1)) (>= m31 (- m21 1)))(and (<= m32 (- m21 1)) (>= m32 (- m21 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m12 (+ m22 1)) (>= m12 (+ m22 1)))(and (<= m13 (+ m22 1)) (>= m13 (+ m22 1)))(and (<= m21 (+ m22 1)) (>= m21 (+ m22 1)))(and (<= m23 (+ m22 1)) (>= m23 (+ m22 1)))(and (<= m31 (+ m22 1)) (>= m31 (+ m22 1)))(and (<= m32 (+ m22 1)) (>= m32 (+ m22 1)))(and (<= m33 (+ m22 1)) (>= m33 (+ m22 1)))))
(assert (or (and (<= m12 (- m22 1)) (>= m12 (- m22 1)))(and (<= m13 (- m22 1)) (>= m13 (- m22 1)))(and (<= m21 (- m22 1)) (>= m21 (- m22 1)))(and (<= m23 (- m22 1)) (>= m23 (- m22 1)))(and (<= m31 (- m22 1)) (>= m31 (- m22 1)))(and (<= m32 (- m22 1)) (>= m32 (- m22 1)))(and (<= m33 (- m22 1)) (>= m33 (- m22 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m13 (+ m24 1)) (>= m13 (+ m24 1)))(and (<= m14 (+ m24 1)) (>= m14 (+ m24 1)))(and (<= m23 (+ m24 1)) (>= m23 (+ m24 1)))(and (<= m25 (+ m24 1)) (>= m25 (+ m24 1)))(and (<= m33 (+ m24 1)) (>= m33 (+ m24 1)))(and (<= m34 (+ m24 1)) (>= m34 (+ m24 1)))(and (<= m35 (+ m24 1)) (>= m35 (+ m24 1)))))
(assert (or (and (<= m13 (- m24 1)) (>= m13 (- m24 1)))(and (<= m14 (- m24 1)) (>= m14 (- m24 1)))(and (<= m23 (- m24 1)) (>= m23 (- m24 1)))(and (<= m25 (- m24 1)) (>= m25 (- m24 1)))(and (<= m33 (- m24 1)) (>= m33 (- m24 1)))(and (<= m34 (- m24 1)) (>= m34 (- m24 1)))(and (<= m35 (- m24 1)) (>= m35 (- m24 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m14 (+ m25 1)) (>= m14 (+ m25 1)))(and (<= m24 (+ m25 1)) (>= m24 (+ m25 1)))(and (<= m26 (+ m25 1)) (>= m26 (+ m25 1)))(and (<= m34 (+ m25 1)) (>= m34 (+ m25 1)))(and (<= m35 (+ m25 1)) (>= m35 (+ m25 1)))(and (<= m36 (+ m25 1)) (>= m36 (+ m25 1)))))
(assert (or (and (<= m14 (- m25 1)) (>= m14 (- m25 1)))(and (<= m24 (- m25 1)) (>= m24 (- m25 1)))(and (<= m26 (- m25 1)) (>= m26 (- m25 1)))(and (<= m34 (- m25 1)) (>= m34 (- m25 1)))(and (<= m35 (- m25 1)) (>= m35 (- m25 1)))(and (<= m36 (- m25 1)) (>= m36 (- m25 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m20 (+ m30 1)) (>= m20 (+ m30 1)))(and (<= m21 (+ m30 1)) (>= m21 (+ m30 1)))(and (<= m31 (+ m30 1)) (>= m31 (+ m30 1)))(and (<= m40 (+ m30 1)) (>= m40 (+ m30 1)))(and (<= m41 (+ m30 1)) (>= m41 (+ m30 1)))))
(assert (or (and (<= m20 (- m30 1)) (>= m20 (- m30 1)))(and (<= m21 (- m30 1)) (>= m21 (- m30 1)))(and (<= m31 (- m30 1)) (>= m31 (- m30 1)))(and (<= m40 (- m30 1)) (>= m40 (- m30 1)))(and (<= m41 (- m30 1)) (>= m41 (- m30 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m25 (+ m36 1)) (>= m25 (+ m36 1)))(and (<= m26 (+ m36 1)) (>= m26 (+ m36 1)))(and (<= m35 (+ m36 1)) (>= m35 (+ m36 1)))(and (<= m45 (+ m36 1)) (>= m45 (+ m36 1)))(and (<= m46 (+ m36 1)) (>= m46 (+ m36 1)))))
(assert (or (and (<= m25 (- m36 1)) (>= m25 (- m36 1)))(and (<= m26 (- m36 1)) (>= m26 (- m36 1)))(and (<= m35 (- m36 1)) (>= m35 (- m36 1)))(and (<= m45 (- m36 1)) (>= m45 (- m36 1)))(and (<= m46 (- m36 1)) (>= m46 (- m36 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m33 (+ m44 1)) (>= m33 (+ m44 1)))(and (<= m34 (+ m44 1)) (>= m34 (+ m44 1)))(and (<= m35 (+ m44 1)) (>= m35 (+ m44 1)))(and (<= m43 (+ m44 1)) (>= m43 (+ m44 1)))(and (<= m45 (+ m44 1)) (>= m45 (+ m44 1)))(and (<= m53 (+ m44 1)) (>= m53 (+ m44 1)))(and (<= m54 (+ m44 1)) (>= m54 (+ m44 1)))))
(assert (or (and (<= m33 (- m44 1)) (>= m33 (- m44 1)))(and (<= m34 (- m44 1)) (>= m34 (- m44 1)))(and (<= m35 (- m44 1)) (>= m35 (- m44 1)))(and (<= m43 (- m44 1)) (>= m43 (- m44 1)))(and (<= m45 (- m44 1)) (>= m45 (- m44 1)))(and (<= m53 (- m44 1)) (>= m53 (- m44 1)))(and (<= m54 (- m44 1)) (>= m54 (- m44 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m34 (+ m45 1)) (>= m34 (+ m45 1)))(and (<= m35 (+ m45 1)) (>= m35 (+ m45 1)))(and (<= m36 (+ m45 1)) (>= m36 (+ m45 1)))(and (<= m44 (+ m45 1)) (>= m44 (+ m45 1)))(and (<= m46 (+ m45 1)) (>= m46 (+ m45 1)))(and (<= m54 (+ m45 1)) (>= m54 (+ m45 1)))))
(assert (or (and (<= m34 (- m45 1)) (>= m34 (- m45 1)))(and (<= m35 (- m45 1)) (>= m35 (- m45 1)))(and (<= m36 (- m45 1)) (>= m36 (- m45 1)))(and (<= m44 (- m45 1)) (>= m44 (- m45 1)))(and (<= m46 (- m45 1)) (>= m46 (- m45 1)))(and (<= m54 (- m45 1)) (>= m54 (- m45 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m35 (+ m46 1)) (>= m35 (+ m46 1)))(and (<= m36 (+ m46 1)) (>= m36 (+ m46 1)))(and (<= m45 (+ m46 1)) (>= m45 (+ m46 1)))))
(assert (or (and (<= m35 (- m46 1)) (>= m35 (- m46 1)))(and (<= m36 (- m46 1)) (>= m36 (- m46 1)))(and (<= m45 (- m46 1)) (>= m45 (- m46 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m41 (+ m52 1)) (>= m41 (+ m52 1)))(and (<= m42 (+ m52 1)) (>= m42 (+ m52 1)))(and (<= m43 (+ m52 1)) (>= m43 (+ m52 1)))(and (<= m53 (+ m52 1)) (>= m53 (+ m52 1)))(and (<= m62 (+ m52 1)) (>= m62 (+ m52 1)))(and (<= m63 (+ m52 1)) (>= m63 (+ m52 1)))))
(assert (or (and (<= m41 (- m52 1)) (>= m41 (- m52 1)))(and (<= m42 (- m52 1)) (>= m42 (- m52 1)))(and (<= m43 (- m52 1)) (>= m43 (- m52 1)))(and (<= m53 (- m52 1)) (>= m53 (- m52 1)))(and (<= m62 (- m52 1)) (>= m62 (- m52 1)))(and (<= m63 (- m52 1)) (>= m63 (- m52 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m52 (+ m63 1)) (>= m52 (+ m63 1)))(and (<= m53 (+ m63 1)) (>= m53 (+ m63 1)))(and (<= m54 (+ m63 1)) (>= m54 (+ m63 1)))(and (<= m62 (+ m63 1)) (>= m62 (+ m63 1)))(and (<= m64 (+ m63 1)) (>= m64 (+ m63 1)))))
(assert (or (and (<= m52 (- m63 1)) (>= m52 (- m63 1)))(and (<= m53 (- m63 1)) (>= m53 (- m63 1)))(and (<= m54 (- m63 1)) (>= m54 (- m63 1)))(and (<= m62 (- m63 1)) (>= m62 (- m63 1)))(and (<= m64 (- m63 1)) (>= m64 (- m63 1)))))
;; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
(assert (or (and (<= m53 (+ m64 1)) (>= m53 (+ m64 1)))(and (<= m54 (+ m64 1)) (>= m54 (+ m64 1)))(and (<= m63 (+ m64 1)) (>= m63 (+ m64 1)))))
(assert (or (and (<= m53 (- m64 1)) (>= m53 (- m64 1)))(and (<= m54 (- m64 1)) (>= m54 (- m64 1)))(and (<= m63 (- m64 1)) (>= m63 (- m64 1)))))
;; Ensures that there is no duplicate values
(assert (and (not (= m02 m46))(not (= m02 m13))(not (= m02 m12))(not (= m02 m14))(not (= m02 m45))(not (= m02 m44))(not (= m02 m54))(not (= m02 m53))(not (= m02 m52))(not (= m02 m36))(not (= m02 m35))(not (= m02 m34))(not (= m02 m33))(not (= m02 m32))(not (= m02 m31))(not (= m02 m30))(not (= m02 m04))(not (= m02 m03))(not (= m02 m62))(not (= m02 m63))(not (= m02 m64))(not (= m02 m24))(not (= m02 m25))(not (= m02 m40))(not (= m02 m41))(not (= m02 m20))(not (= m02 m21))(not (= m02 m22))(not (= m02 m23))(not (= m02 m42))(not (= m02 m43))(not (= m02 m26))))
(assert (and (not (= m03 m46))(not (= m03 m13))(not (= m03 m12))(not (= m03 m14))(not (= m03 m45))(not (= m03 m44))(not (= m03 m54))(not (= m03 m53))(not (= m03 m52))(not (= m03 m36))(not (= m03 m35))(not (= m03 m34))(not (= m03 m33))(not (= m03 m32))(not (= m03 m31))(not (= m03 m30))(not (= m03 m04))(not (= m03 m62))(not (= m03 m63))(not (= m03 m64))(not (= m03 m24))(not (= m03 m25))(not (= m03 m40))(not (= m03 m41))(not (= m03 m20))(not (= m03 m21))(not (= m03 m22))(not (= m03 m23))(not (= m03 m42))(not (= m03 m43))(not (= m03 m26))))
(assert (and (not (= m04 m46))(not (= m04 m13))(not (= m04 m12))(not (= m04 m14))(not (= m04 m45))(not (= m04 m44))(not (= m04 m54))(not (= m04 m53))(not (= m04 m52))(not (= m04 m36))(not (= m04 m35))(not (= m04 m34))(not (= m04 m33))(not (= m04 m32))(not (= m04 m31))(not (= m04 m30))(not (= m04 m62))(not (= m04 m63))(not (= m04 m64))(not (= m04 m24))(not (= m04 m25))(not (= m04 m40))(not (= m04 m41))(not (= m04 m20))(not (= m04 m21))(not (= m04 m22))(not (= m04 m23))(not (= m04 m42))(not (= m04 m43))(not (= m04 m26))))
(assert (and (not (= m12 m46))(not (= m12 m13))(not (= m12 m14))(not (= m12 m45))(not (= m12 m44))(not (= m12 m54))(not (= m12 m53))(not (= m12 m52))(not (= m12 m36))(not (= m12 m35))(not (= m12 m34))(not (= m12 m33))(not (= m12 m32))(not (= m12 m31))(not (= m12 m30))(not (= m12 m62))(not (= m12 m63))(not (= m12 m64))(not (= m12 m24))(not (= m12 m25))(not (= m12 m40))(not (= m12 m41))(not (= m12 m20))(not (= m12 m21))(not (= m12 m22))(not (= m12 m23))(not (= m12 m42))(not (= m12 m43))(not (= m12 m26))))
(assert (and (not (= m13 m46))(not (= m13 m14))(not (= m13 m45))(not (= m13 m44))(not (= m13 m54))(not (= m13 m53))(not (= m13 m52))(not (= m13 m36))(not (= m13 m35))(not (= m13 m34))(not (= m13 m33))(not (= m13 m32))(not (= m13 m31))(not (= m13 m30))(not (= m13 m62))(not (= m13 m63))(not (= m13 m64))(not (= m13 m24))(not (= m13 m25))(not (= m13 m40))(not (= m13 m41))(not (= m13 m20))(not (= m13 m21))(not (= m13 m22))(not (= m13 m23))(not (= m13 m42))(not (= m13 m43))(not (= m13 m26))))
(assert (and (not (= m14 m46))(not (= m14 m45))(not (= m14 m44))(not (= m14 m54))(not (= m14 m53))(not (= m14 m52))(not (= m14 m36))(not (= m14 m35))(not (= m14 m34))(not (= m14 m33))(not (= m14 m32))(not (= m14 m31))(not (= m14 m30))(not (= m14 m62))(not (= m14 m63))(not (= m14 m64))(not (= m14 m24))(not (= m14 m25))(not (= m14 m40))(not (= m14 m41))(not (= m14 m20))(not (= m14 m21))(not (= m14 m22))(not (= m14 m23))(not (= m14 m42))(not (= m14 m43))(not (= m14 m26))))
(assert (and (not (= m20 m46))(not (= m20 m45))(not (= m20 m44))(not (= m20 m54))(not (= m20 m53))(not (= m20 m52))(not (= m20 m36))(not (= m20 m35))(not (= m20 m34))(not (= m20 m33))(not (= m20 m32))(not (= m20 m31))(not (= m20 m30))(not (= m20 m62))(not (= m20 m63))(not (= m20 m64))(not (= m20 m24))(not (= m20 m25))(not (= m20 m40))(not (= m20 m41))(not (= m20 m21))(not (= m20 m22))(not (= m20 m23))(not (= m20 m42))(not (= m20 m43))(not (= m20 m26))))
(assert (and (not (= m21 m46))(not (= m21 m45))(not (= m21 m44))(not (= m21 m54))(not (= m21 m53))(not (= m21 m52))(not (= m21 m36))(not (= m21 m35))(not (= m21 m34))(not (= m21 m33))(not (= m21 m32))(not (= m21 m31))(not (= m21 m30))(not (= m21 m62))(not (= m21 m63))(not (= m21 m64))(not (= m21 m24))(not (= m21 m25))(not (= m21 m40))(not (= m21 m41))(not (= m21 m22))(not (= m21 m23))(not (= m21 m42))(not (= m21 m43))(not (= m21 m26))))
(assert (and (not (= m22 m46))(not (= m22 m45))(not (= m22 m44))(not (= m22 m54))(not (= m22 m53))(not (= m22 m52))(not (= m22 m36))(not (= m22 m35))(not (= m22 m34))(not (= m22 m33))(not (= m22 m32))(not (= m22 m31))(not (= m22 m30))(not (= m22 m62))(not (= m22 m63))(not (= m22 m64))(not (= m22 m24))(not (= m22 m25))(not (= m22 m40))(not (= m22 m41))(not (= m22 m23))(not (= m22 m42))(not (= m22 m43))(not (= m22 m26))))
(assert (and (not (= m23 m46))(not (= m23 m45))(not (= m23 m44))(not (= m23 m54))(not (= m23 m53))(not (= m23 m52))(not (= m23 m36))(not (= m23 m35))(not (= m23 m34))(not (= m23 m33))(not (= m23 m32))(not (= m23 m31))(not (= m23 m30))(not (= m23 m62))(not (= m23 m63))(not (= m23 m64))(not (= m23 m24))(not (= m23 m25))(not (= m23 m40))(not (= m23 m41))(not (= m23 m42))(not (= m23 m43))(not (= m23 m26))))
(assert (and (not (= m24 m46))(not (= m24 m45))(not (= m24 m44))(not (= m24 m54))(not (= m24 m53))(not (= m24 m52))(not (= m24 m36))(not (= m24 m35))(not (= m24 m34))(not (= m24 m33))(not (= m24 m32))(not (= m24 m31))(not (= m24 m30))(not (= m24 m62))(not (= m24 m63))(not (= m24 m64))(not (= m24 m25))(not (= m24 m40))(not (= m24 m41))(not (= m24 m42))(not (= m24 m43))(not (= m24 m26))))
(assert (and (not (= m25 m46))(not (= m25 m45))(not (= m25 m44))(not (= m25 m54))(not (= m25 m53))(not (= m25 m52))(not (= m25 m36))(not (= m25 m35))(not (= m25 m34))(not (= m25 m33))(not (= m25 m32))(not (= m25 m31))(not (= m25 m30))(not (= m25 m62))(not (= m25 m63))(not (= m25 m64))(not (= m25 m40))(not (= m25 m41))(not (= m25 m42))(not (= m25 m43))(not (= m25 m26))))
(assert (and (not (= m26 m46))(not (= m26 m45))(not (= m26 m44))(not (= m26 m54))(not (= m26 m53))(not (= m26 m52))(not (= m26 m36))(not (= m26 m35))(not (= m26 m34))(not (= m26 m33))(not (= m26 m32))(not (= m26 m31))(not (= m26 m30))(not (= m26 m62))(not (= m26 m63))(not (= m26 m64))(not (= m26 m40))(not (= m26 m41))(not (= m26 m42))(not (= m26 m43))))
(assert (and (not (= m30 m46))(not (= m30 m45))(not (= m30 m44))(not (= m30 m54))(not (= m30 m53))(not (= m30 m52))(not (= m30 m36))(not (= m30 m35))(not (= m30 m34))(not (= m30 m33))(not (= m30 m32))(not (= m30 m31))(not (= m30 m62))(not (= m30 m63))(not (= m30 m64))(not (= m30 m40))(not (= m30 m41))(not (= m30 m42))(not (= m30 m43))))
(assert (and (not (= m31 m46))(not (= m31 m45))(not (= m31 m44))(not (= m31 m54))(not (= m31 m53))(not (= m31 m52))(not (= m31 m36))(not (= m31 m35))(not (= m31 m34))(not (= m31 m33))(not (= m31 m32))(not (= m31 m62))(not (= m31 m63))(not (= m31 m64))(not (= m31 m40))(not (= m31 m41))(not (= m31 m42))(not (= m31 m43))))
(assert (and (not (= m32 m46))(not (= m32 m45))(not (= m32 m44))(not (= m32 m54))(not (= m32 m53))(not (= m32 m52))(not (= m32 m36))(not (= m32 m35))(not (= m32 m34))(not (= m32 m33))(not (= m32 m62))(not (= m32 m63))(not (= m32 m64))(not (= m32 m40))(not (= m32 m41))(not (= m32 m42))(not (= m32 m43))))
(assert (and (not (= m33 m46))(not (= m33 m45))(not (= m33 m44))(not (= m33 m54))(not (= m33 m53))(not (= m33 m52))(not (= m33 m36))(not (= m33 m35))(not (= m33 m34))(not (= m33 m62))(not (= m33 m63))(not (= m33 m64))(not (= m33 m40))(not (= m33 m41))(not (= m33 m42))(not (= m33 m43))))
(assert (and (not (= m34 m46))(not (= m34 m45))(not (= m34 m44))(not (= m34 m54))(not (= m34 m53))(not (= m34 m52))(not (= m34 m36))(not (= m34 m35))(not (= m34 m62))(not (= m34 m63))(not (= m34 m64))(not (= m34 m40))(not (= m34 m41))(not (= m34 m42))(not (= m34 m43))))
(assert (and (not (= m35 m46))(not (= m35 m45))(not (= m35 m44))(not (= m35 m54))(not (= m35 m53))(not (= m35 m52))(not (= m35 m36))(not (= m35 m62))(not (= m35 m63))(not (= m35 m64))(not (= m35 m40))(not (= m35 m41))(not (= m35 m42))(not (= m35 m43))))
(assert (and (not (= m36 m46))(not (= m36 m45))(not (= m36 m44))(not (= m36 m54))(not (= m36 m53))(not (= m36 m52))(not (= m36 m62))(not (= m36 m63))(not (= m36 m64))(not (= m36 m40))(not (= m36 m41))(not (= m36 m42))(not (= m36 m43))))
(assert (and (not (= m40 m46))(not (= m40 m45))(not (= m40 m44))(not (= m40 m54))(not (= m40 m53))(not (= m40 m52))(not (= m40 m62))(not (= m40 m63))(not (= m40 m64))(not (= m40 m41))(not (= m40 m42))(not (= m40 m43))))
(assert (and (not (= m41 m46))(not (= m41 m45))(not (= m41 m44))(not (= m41 m54))(not (= m41 m53))(not (= m41 m52))(not (= m41 m62))(not (= m41 m63))(not (= m41 m64))(not (= m41 m42))(not (= m41 m43))))
(assert (and (not (= m42 m46))(not (= m42 m45))(not (= m42 m44))(not (= m42 m54))(not (= m42 m53))(not (= m42 m52))(not (= m42 m62))(not (= m42 m63))(not (= m42 m64))(not (= m42 m43))))
(assert (and (not (= m43 m46))(not (= m43 m45))(not (= m43 m44))(not (= m43 m54))(not (= m43 m53))(not (= m43 m52))(not (= m43 m62))(not (= m43 m63))(not (= m43 m64))))
(assert (and (not (= m44 m46))(not (= m44 m45))(not (= m44 m54))(not (= m44 m53))(not (= m44 m52))(not (= m44 m62))(not (= m44 m63))(not (= m44 m64))))
(assert (and (not (= m45 m46))(not (= m45 m54))(not (= m45 m53))(not (= m45 m52))(not (= m45 m62))(not (= m45 m63))(not (= m45 m64))))
(assert (and (not (= m46 m54))(not (= m46 m53))(not (= m46 m52))(not (= m46 m62))(not (= m46 m63))(not (= m46 m64))))
(assert (and (not (= m52 m54))(not (= m52 m53))(not (= m52 m62))(not (= m52 m63))(not (= m52 m64))))
(assert (and (not (= m53 m54))(not (= m53 m62))(not (= m53 m63))(not (= m53 m64))))
(assert (and (not (= m54 m62))(not (= m54 m63))(not (= m54 m64))))
(assert (and (not (= m62 m63))(not (= m62 m64))))
(assert (and (not (= m63 m64))))
(check-sat)
(get-model)
