class CreateMasterCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :customer_firm_name
      t.string :contact_person
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :pincode
      t.string :phone1
      t.string :phone2
      t.string :email
      t.integer :blacklisted
      t.boolean :status

      t.timestamps
    end
  end
end
