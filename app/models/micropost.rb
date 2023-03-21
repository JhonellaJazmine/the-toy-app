class Micropost < ApplicationRecord
    belongs_to :user
    validates :title, :content, :image, :additional_images, length: { maximum: 140 }, 
                        presence: true

    has_one_attached :image
    has_many_attached :additional_images
    validates :image, attached:true, content_type: { in:
    %w(.jpeg .png .jpg), message: 'must be in JPG, JPEG, or PNG format'}


    validates :additional_images, attached:true, content_type: { in:
    %w(.jpeg .png .jpg), message: 'must be in JPG, JPEG, or PNG format'}

    def image_as_thumbnail
        image.variant(resize_to_limit: [350,350]).processed
    end

    def additional_image_as_thumbnail(pic)
        # pic.variant(resize: "200x200!").processed
        # pic.variant(resize: "#{200.to_f}x#{200.to_f}!").processed
        pic.variant(resize_to_limit: [200,200]).processed
    end

end


