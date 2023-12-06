module Master
  class ProductL3Category < ApplicationRecord
    belongs_to :product_l2_category
    belongs_to :product_l1_category
    has_many :product_names
    mount_uploader :l3_category_image, AvatarUploader

    validates :l3_category_name, presence: true
    validates :l3_category_image, presence: true
    validates_format_of :l3_category_name, with: /\A[a-zA-Z]+\z/, message: "only allows letters"

  end
end