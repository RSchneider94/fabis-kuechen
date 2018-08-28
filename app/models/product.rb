class Product < ApplicationRecord
  validates :name, presence: true
  has_many :orders
  has_many :comments

  def self.search(search_query)
    if Rails.env.production?
      Product.where("name ilike ?", "%#{ search_query }%")
    else
      Product.where("name LIKE ?", "%#{ search_query }%")
    end
  end

  def highest_rating_comment_first
    comments.rating_desc
  end

  def lowest_rating_comment_first
    comments.rating_asc
  end

  def average_rating
    comments.average(:rating).to_f
  end
end
