module Master
  class ProductL2Category < ApplicationRecord
    belongs_to :product_l1_category
    has_many :product_l3_categories
    has_many :product_names
    mount_uploader :l2_category_image, AvatarUploader

    validates :l2_category_name, presence: true
    validates :l2_category_image, presence: true
    validates_format_of :l2_category_name, with: /\A[a-zA-Z]+\z/, message: "only allows letters"

  end
end
