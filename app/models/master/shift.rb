module Master
    class Shift < ApplicationRecord
        validates :shift_name, presence: true
        
    end
end