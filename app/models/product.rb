class Product < ApplicationRecord
  has_many :orders

  def self.search(search_query)
    if Rails.env.production?
      Product.where("name ilike ?", "%#{ search_query }%")
    else
      Product.where("name LIKE ?", "%#{ search_query }%")
    end
  end
end
