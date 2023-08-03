class Request < ApplicationRecord
  enum genre: {
    claim:          0,
    impression:     1,
    new_attack:     2,
    new_deathblow:  3,
    new_enemy:      4,
    new_boss:       5,
    new_map:        6
  }

  enum status: {
    not_checked:  0,
    responding:   1,
    responded:    2
  }

  validates :email,   presence: true
  validates :content, presence: true, length: { in: 1..500 }

  scope :latest,      -> {order(created_at: :desc)}
  scope :old,         -> {order(created_at: :asc)}
  scope :many_score,  -> {order(score: :desc)}
  scope :few_score,   -> {order(score: :asc)}

end
