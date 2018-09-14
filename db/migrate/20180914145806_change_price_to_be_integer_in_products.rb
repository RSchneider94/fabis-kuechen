class ChangePriceToBeIntegerInProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :new_price_column, :integer
  end
end
