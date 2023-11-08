class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :likes,dependent: :destroy

  validates :user, uniqueness: { scope: :movie, message: "You can only submit one review per movie." }
  validates :comment, presence: { message: "Review cannot be empty" }
end
