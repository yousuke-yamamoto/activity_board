class Activity < ApplicationRecord
    has_many :comments, dependent: :destroy
    
    validates :branch_name, presence:true, length: {maximum: 10}
    validates :title, presence:true, length: {maximum: 30}
    validates :content, presence:true, length: {maximum: 1000}
    mount_uploader :img, ImageUploader
end
