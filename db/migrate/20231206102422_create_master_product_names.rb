class CreateMasterProductNames < ActiveRecord::Migration[6.1]
  def change
    create_table :product_names do |t|
      t.references :product_l1_category, null: false, foreign_key: true
      t.references :product_l2_category, null: false, foreign_key: true
      t.references :product_l3_category, null: false, foreign_key: true
      t.string :product_name
      t.references :unit_of_measurement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
