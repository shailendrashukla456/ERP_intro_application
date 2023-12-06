module Master
    class Tax < ApplicationRecord
        validates :tax_name, presence: true
    end
end
