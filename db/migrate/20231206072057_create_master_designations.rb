class CreateMasterDesignations < ActiveRecord::Migration[6.1]
  def change
    create_table :designations do |t|
      t.references :department, null: false, foreign_key: true
      t.string :designation

      t.timestamps
    end
  end
end
