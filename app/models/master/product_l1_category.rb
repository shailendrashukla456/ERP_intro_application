module Master
    class ProductL1Category < ApplicationRecord
        mount_uploader :l1_category_image, AvatarUploader
        has_many :product_l2_categories
        has_many :product_l3_categories
        has_many :product_names

        validates :l1_category_name, presence: true
        validates :l1_category_image, presence: true

        validates_format_of :l1_category_name, with: /\A[a-zA-Z]+\z/, message: "only allows letters"

    end
end
