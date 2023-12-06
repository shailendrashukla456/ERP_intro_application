class CreateMasterProductL3Categories < ActiveRecord::Migration[6.1]
  def change
    create_table :product_l3_categories do |t|
      t.references :product_l2_category, null: false, foreign_key: true
      t.references :product_l1_category, null: false, foreign_key: true
      t.string :l3_category_name
      t.string :l3_category_image

      t.timestamps
    end
  end
end
