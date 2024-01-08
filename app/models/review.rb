class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :likes,dependent: :destroy

  # scope :most_liked_first, -> {   count(joins(:likes).where(likes: {liked: true}) ).order('DESC') }

  validates :user, uniqueness: { scope: :movie, message: "You can only submit one review per movie." }
  validates :comment, presence: { message: "Review cannot be empty" }
end
