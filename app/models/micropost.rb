class Micropost < ApplicationRecord
    belongs_to :user
    validates :title, :content, :image, length: { maximum: 140 }, 
                        presence: true

    has_one_attached :image

    validates :image, attached:true, content_type: { in:
    %w(images/jpeg image/png image/jpg), message: 'must be in JPG, JPEG, or PNG format'}
end


