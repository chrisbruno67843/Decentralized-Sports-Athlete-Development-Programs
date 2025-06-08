;; Academy Verification Contract
;; Validates and manages sports development academies

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ACADEMY_EXISTS (err u101))
(define-constant ERR_ACADEMY_NOT_FOUND (err u102))
(define-constant ERR_INVALID_STATUS (err u103))

(define-map academies
  { academy-id: uint }
  {
    name: (string-ascii 100),
    location: (string-ascii 100),
    sport-type: (string-ascii 50),
    verified: bool,
    registration-date: uint,
    owner: principal
  }
)

(define-map academy-counter { id: uint } { count: uint })

(define-data-var next-academy-id uint u1)

;; Register a new academy
(define-public (register-academy (name (string-ascii 100)) (location (string-ascii 100)) (sport-type (string-ascii 50)))
  (let ((academy-id (var-get next-academy-id)))
    (asserts! (is-none (map-get? academies { academy-id: academy-id })) ERR_ACADEMY_EXISTS)
    (map-set academies
      { academy-id: academy-id }
      {
        name: name,
        location: location,
        sport-type: sport-type,
        verified: false,
        registration-date: block-height,
        owner: tx-sender
      }
    )
    (var-set next-academy-id (+ academy-id u1))
    (ok academy-id)
  )
)

;; Verify an academy (only contract owner)
(define-public (verify-academy (academy-id uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (match (map-get? academies { academy-id: academy-id })
      academy-data
      (begin
        (map-set academies
          { academy-id: academy-id }
          (merge academy-data { verified: true })
        )
        (ok true)
      )
      ERR_ACADEMY_NOT_FOUND
    )
  )
)

;; Get academy details
(define-read-only (get-academy (academy-id uint))
  (map-get? academies { academy-id: academy-id })
)

;; Check if academy is verified
(define-read-only (is-academy-verified (academy-id uint))
  (match (map-get? academies { academy-id: academy-id })
    academy-data (get verified academy-data)
    false
  )
)
