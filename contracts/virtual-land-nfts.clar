;; Virtual Land NFT Contract
;; A simple non-fungible token implementation for virtual land plots

(define-non-fungible-token virtual-land uint)

(define-constant err-not-owner (err u100))
(define-constant err-invalid-id (err u101))

;; Mint a new virtual land plot NFT
(define-public (mint-land (land-id uint) (recipient principal))
  (begin
    (asserts! (> land-id u0) err-invalid-id)
    (try! (nft-mint? virtual-land land-id recipient))
    (ok {land-id: land-id, owner: recipient})))

;; Get the owner of a land plot
(define-read-only (get-land-owner (land-id uint))
  (begin
    (asserts! (> land-id u0) err-invalid-id)
    (ok (nft-get-owner? virtual-land land-id))))
