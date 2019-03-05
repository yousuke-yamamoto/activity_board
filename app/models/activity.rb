class Activity < ApplicationRecord
    validates :branch_name, presence:true
    validates :title, presence:true
    validates :content, presence:true
    mount_uploader :img, ImageUploader
end
