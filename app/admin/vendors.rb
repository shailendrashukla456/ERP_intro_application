ActiveAdmin.register Master::Vendor, as: 'Vendor' do
    permit_params :vendor_firm_name, :contact_person, :address1, :address_2, :city, :pincode, :phone1, :phone2, :email, :status, :blacklisted
  
    form do |f|
      f.inputs 'Vendor Details' do
        f.input :vendor_firm_name
        f.input :contact_person
        f.input :address_1
        f.input :address_2
        f.input :city
        f.input :pincode
        f.input :phone1
        f.input :phone2
        f.input :email
        f.input :status
        f.input :blacklisted
      end
      f.actions
    end
  
    index do
      selectable_column
      id_column
      column :vendor_firm_name
      column :contact_person
      column :address1
      column :city
      column :pincode
      column :phone1
      column :email
      column :status
      column :blacklisted
      actions
    end
  
    # Other configurations...
  
  end