class Product < ApplicationRecord
  has_many :orders

  def self.search(search_query)
    Product.where("name LIKE ?", "%#{ search_query }%")
  end
end
