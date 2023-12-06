module Master
    class Department < ApplicationRecord

        has_many :designations
        has_many :user_profiles

        validates :department_name, presence: true
        validates_format_of :department_name, with: /\A[a-zA-Z]+\z/, message: "only allows letters"
        
    end
end
