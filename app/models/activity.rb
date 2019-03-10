class Activity < ApplicationRecord
    has_many :comments, dependent: :destroy
    
    validates :branch_name, presence:true
    validates :title, presence:true
    validates :content, presence:true
    mount_uploader :img, ImageUploader
end
