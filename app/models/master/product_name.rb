module Master
  class ProductName < ApplicationRecord
    belongs_to :product_l1_category
    belongs_to :product_l2_category
    belongs_to :product_l3_category
    belongs_to :unit_of_measurement
    delegate :name, :l1_category_image, to: :product_l1_category, prefix: true, allow_nil: true
    delegate :name, :l3_category_image, to: :product_l2_category, prefix: true, allow_nil: true
    delegate :name, :l3_category_image, to: :product_l3_category, prefix: true, allow_nil: true
  
  end
end
