class User < ApplicationRecord
    
    PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
/x
    
    has_many :microposts, dependent: :destroy
    validates :name, :email, :password, :password_confirmation, presence: true 
    validates :name, :email, uniqueness: { case_sensitive: false }
    
    has_secure_password
    validates :password, presence: true, format: { with: PASSWORD_FORMAT, message: 'must contain a digit, a lower case character, and an upper case character '}, length: { minimum: 8 }

    has_one_attached :avatar
    validates :avatar, content_type: { in:
    %w(.jpeg .png .jpg), message: 'must be in JPG, JPEG, or PNG format'}
end
