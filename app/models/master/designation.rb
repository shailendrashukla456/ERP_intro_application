module Master
  class Designation < ApplicationRecord
    belongs_to :department
    has_many :user_profiles

    validates :designation, presence: true
    validates_format_of :designation, with: /\A[a-zA-Z]+\z/, message: "only allows letters"
  end
end
