ActiveAdmin.register Master::Customer, as: 'Customer' do
    
    permit_params :customer_firm_name, :contact_person, :address1, :address_2, :city, :pincode, :phone1, :phone2, :email, :status , :blacklisted
  
   
  end