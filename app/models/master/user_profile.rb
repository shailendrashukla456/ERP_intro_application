module Master
  class UserProfile < ApplicationRecord
    belongs_to :department
    belongs_to :designation
    mount_uploader :upload_photo, AvatarUploader
    
  end
end
