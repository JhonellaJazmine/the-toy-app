class Micropost < ApplicationRecord
    belongs_to :user
    validates :title, :content, :image, length: { maximum: 140 }, 
                        presence: true

    has_one_attached :image
    has_many_attached :additional_images
    validates :image, attached:true, content_type: { in:
    %w(.jpeg .png .jpg), message: 'must be in JPG, JPEG, or PNG format'}


    def image_as_thumbnail
        image.variant(resize: "350x350!").processed
    end


    def additional_image_as_thumbnail(pic)
        pic.variant(resize: "200x200!").processed
    end

end


