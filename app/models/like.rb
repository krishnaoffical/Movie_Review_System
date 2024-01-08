class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user, uniqueness: { scope: :review, message: "You've already liked this review." }
end
