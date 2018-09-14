class DropNewPricesColumnsInProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :new_price_column
    # remove_column :products, :price_new
  end
end
