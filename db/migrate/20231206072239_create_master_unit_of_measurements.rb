class CreateMasterUnitOfMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :unit_of_measurements do |t|
      t.string :uom_name

      t.timestamps
    end
  end
end
