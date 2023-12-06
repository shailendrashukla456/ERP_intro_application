class DropToTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :master_product_l1_categories
  end
end
