class CreateMasterShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.string :shift_name

      t.timestamps
    end
  end
end
