module Master
    class Vendor < ApplicationRecord
        enum status: { active: 0, inactive: 1 }
        
        validates :vendor_firm_name, presence: true
        validates :contact_person, presence: true    
        validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
                                              message: "must be a valid email address" }
        validates :phone1, presence: true, length: { minimum: 10, maximum: 15 }, format: { with: /\A\d+\z/ }
        validates :pincode, format: { with: /\A\d{6}\z/, message: "should be a valid 6-digit pincode" }, allow_blank: true
                                            
        validates :status, inclusion: { in: [true, false] }
    end
end
