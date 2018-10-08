class Comment < ApplicationRecord
  # Validations
  validates :body, presence: true
  validates :rating, numericality: { only_integer: true }
  # Jobs
  after_create_commit { CommentUpdateJob.perform_later(self, self.user) }
  # Relationships
  belongs_to :user
  belongs_to :product
  # Pagination
  self.per_page = 2
  # Methods
  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }
end
