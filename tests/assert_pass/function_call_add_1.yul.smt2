(define-const _revert_1024_0 (_ BitVec 256) #x0000000000000000000000000000000000000000000000000000000000000000)
(define-const _stop_1025_0 (_ BitVec 256) #x0000000000000000000000000000000000000000000000000000000000000000)
(declare-const _address_1026_0 (_ BitVec 256))
(declare-const _basefee_1039_0 (_ BitVec 256))
(declare-const _calldatasize_1030_0 (_ BitVec 256))
(declare-const _caller_1028_0 (_ BitVec 256))
(declare-const _callvalue_1029_0 (_ BitVec 256))
(declare-const _chainid_1038_0 (_ BitVec 256))
(declare-const _codesize_1031_0 (_ BitVec 256))
(declare-const _coinbase_1033_0 (_ BitVec 256))
(declare-const _difficulty_1036_0 (_ BitVec 256))
(declare-const _gaslimit_1037_0 (_ BitVec 256))
(declare-const _gasprice_1032_0 (_ BitVec 256))
(declare-const _number_1035_0 (_ BitVec 256))
(declare-const _origin_1027_0 (_ BitVec 256))
(declare-const _timestamp_1034_0 (_ BitVec 256))
(assert (= ((_ extract 255 160) _address_1026_0) #x000000000000000000000000))

(define-const _1 (_ BitVec 256) _address_1026_0)
(define-const x_6_1 (_ BitVec 256) _1)
(define-const _2 (_ BitVec 256) _address_1026_0)
(define-const y_7_1 (_ BitVec 256) _2)
(declare-const a_3_0 (_ BitVec 256))
(declare-const b_4_0 (_ BitVec 256))
(define-const _3 (_ BitVec 256) #x0000000000000000000000000000000000000000000000000000000000000000)
(define-const c_5_1 (_ BitVec 256) _3)
(define-const _4 (_ BitVec 256) #x0000000000000000000000000000000000000000000000000000000000000064)
(define-const _5 (_ BitVec 256) (ite (bvugt a_3_0 _4) #x0000000000000000000000000000000000000000000000000000000000000001 #x0000000000000000000000000000000000000000000000000000000000000000))
(define-const _6 (_ BitVec 256) #x0000000000000000000000000000000000000000000000000000000000000000)
(define-const _7 (_ BitVec 256) #x0000000000000000000000000000000000000000000000000000000000000000)
(define-const _revert_1024_1 (_ BitVec 256) (ite (and (= _revert_1024_0 #x0000000000000000000000000000000000000000000000000000000000000000) (= _stop_1025_0 #x0000000000000000000000000000000000000000000000000000000000000000)) #x0000000000000000000000000000000000000000000000000000000000000001 _revert_1024_0))
(define-const _revert_1024_2 (_ BitVec 256) (ite (= _5 #x0000000000000000000000000000000000000000000000000000000000000000) _revert_1024_0 _revert_1024_1))

(define-const _8 (_ BitVec 256) #x0000000000000000000000000000000000000000000000000000000000000064)
(define-const _9 (_ BitVec 256) (ite (bvugt b_4_0 _8) #x0000000000000000000000000000000000000000000000000000000000000001 #x0000000000000000000000000000000000000000000000000000000000000000))
(define-const _10 (_ BitVec 256) #x0000000000000000000000000000000000000000000000000000000000000000)
(define-const _11 (_ BitVec 256) #x0000000000000000000000000000000000000000000000000000000000000000)
(define-const _revert_1024_3 (_ BitVec 256) (ite (and (= _revert_1024_2 #x0000000000000000000000000000000000000000000000000000000000000000) (= _stop_1025_0 #x0000000000000000000000000000000000000000000000000000000000000000)) #x0000000000000000000000000000000000000000000000000000000000000001 _revert_1024_2))
(define-const _revert_1024_4 (_ BitVec 256) (ite (= _9 #x0000000000000000000000000000000000000000000000000000000000000000) _revert_1024_2 _revert_1024_3))

(define-const _12 (_ BitVec 256) (bvadd a_3_0 b_4_0))
(define-const c_5_2 (_ BitVec 256) _12)
(assert (= x_6_1 a_3_0))
(assert (= y_7_1 b_4_0))
(define-const _13 (_ BitVec 256) (ite (bvugt x_6_1 c_5_2) #x0000000000000000000000000000000000000000000000000000000000000001 #x0000000000000000000000000000000000000000000000000000000000000000))
(define-const _14 (_ BitVec 256) (ite (= _13 #x0000000000000000000000000000000000000000000000000000000000000000) #x0000000000000000000000000000000000000000000000000000000000000001 #x0000000000000000000000000000000000000000000000000000000000000000))
(assert (and (and (= _revert_1024_4 #x0000000000000000000000000000000000000000000000000000000000000000) (= _stop_1025_0 #x0000000000000000000000000000000000000000000000000000000000000000)) (= #x0000000000000000000000000000000000000000000000000000000000000000 _14)))
(assert (not (= _revert_1024_4 #x0000000000000000000000000000000000000000000000000000000000000000)))