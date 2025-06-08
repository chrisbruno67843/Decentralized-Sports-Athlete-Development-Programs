;; Athlete Tracking Contract
;; Tracks athlete development progress and profiles

(define-constant ERR_UNAUTHORIZED (err u200))
(define-constant ERR_ATHLETE_EXISTS (err u201))
(define-constant ERR_ATHLETE_NOT_FOUND (err u202))
(define-constant ERR_INVALID_ACADEMY (err u203))

(define-map athletes
  { athlete-id: uint }
  {
    name: (string-ascii 100),
    age: uint,
    sport: (string-ascii 50),
    academy-id: uint,
    registration-date: uint,
    active: bool,
    owner: principal
  }
)

(define-map athlete-progress
  { athlete-id: uint, metric: (string-ascii 50) }
  {
    value: uint,
    last-updated: uint,
    recorded-by: principal
  }
)

(define-data-var next-athlete-id uint u1)

;; Register a new athlete
(define-public (register-athlete (name (string-ascii 100)) (age uint) (sport (string-ascii 50)) (academy-id uint))
  (let ((athlete-id (var-get next-athlete-id)))
    (asserts! (is-none (map-get? athletes { athlete-id: athlete-id })) ERR_ATHLETE_EXISTS)
    ;; Verify academy exists (simplified check)
    (asserts! (> academy-id u0) ERR_INVALID_ACADEMY)
    (map-set athletes
      { athlete-id: athlete-id }
      {
        name: name,
        age: age,
        sport: sport,
        academy-id: academy-id,
        registration-date: block-height,
        active: true,
        owner: tx-sender
      }
    )
    (var-set next-athlete-id (+ athlete-id u1))
    (ok athlete-id)
  )
)

;; Update athlete progress
(define-public (update-progress (athlete-id uint) (metric (string-ascii 50)) (value uint))
  (begin
    (asserts! (is-some (map-get? athletes { athlete-id: athlete-id })) ERR_ATHLETE_NOT_FOUND)
    (map-set athlete-progress
      { athlete-id: athlete-id, metric: metric }
      {
        value: value,
        last-updated: block-height,
        recorded-by: tx-sender
      }
    )
    (ok true)
  )
)

;; Get athlete details
(define-read-only (get-athlete (athlete-id uint))
  (map-get? athletes { athlete-id: athlete-id })
)

;; Get athlete progress for specific metric
(define-read-only (get-athlete-progress (athlete-id uint) (metric (string-ascii 50)))
  (map-get? athlete-progress { athlete-id: athlete-id, metric: metric })
)
