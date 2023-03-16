class User < ApplicationRecord
    has_many :microposts, dependent: :destroy
    validates :name, :email, :password, :password_confirmation, presence: true 
    validates :name, :email, uniqueness: { case_sensitive: false }
    has_secure_password
    has_one_attached :avatar

    validates :avatar, content_type: { in:
    %w(.jpeg .png .jpg), message: 'must be in JPG, JPEG, or PNG format'}
end
