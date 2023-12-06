class CreateTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :taxes do |t|
      t.string :tax_name

      t.timestamps
    end
  end
end
