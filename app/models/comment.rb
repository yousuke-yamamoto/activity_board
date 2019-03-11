class Comment < ApplicationRecord
    belongs_to :activity
    
    validates :name, presence: true, length: { maximum: 20}
    validates :comment, presence: true, length: { maximum: 1000 }
end
