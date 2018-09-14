class ChangeProductsPriceToInteger < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price_new, :integer
  end
end
