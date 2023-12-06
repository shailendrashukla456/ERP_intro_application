class CreateMasterProductL1Categories < ActiveRecord::Migration[6.1]
  def change
    create_table :product_l1_categories do |t|
      t.string :l1_category_name
      t.string :l1_category_image

      t.timestamps
    end
  end
end
