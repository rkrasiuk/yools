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

(define-const _1 (_ BitVec 256) #x0000000000000000000000000000000000000000000000000000000000000000)
(define-const x_2_1 (_ BitVec 256) _1)
(define-const _2 (_ BitVec 256) #x0000000000000000000000000000000000000000000000000000000000000000)
(define-const _3 (_ BitVec 256) (ite (= x_2_1 _2) #x0000000000000000000000000000000000000000000000000000000000000001 #x0000000000000000000000000000000000000000000000000000000000000000))
(assert (and (and (= _revert_1024_0 #x0000000000000000000000000000000000000000000000000000000000000000) (= _stop_1025_0 #x0000000000000000000000000000000000000000000000000000000000000000)) (= #x0000000000000000000000000000000000000000000000000000000000000000 _3)))
(assert (not (= _revert_1024_0 #x0000000000000000000000000000000000000000000000000000000000000000)))
