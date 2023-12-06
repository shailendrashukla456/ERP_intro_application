module Master
    class UnitOfMeasurement < ApplicationRecord
        has_many :product_names
        validates :uom_name, presence: true
    end
end