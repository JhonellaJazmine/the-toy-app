class User < ApplicationRecord
    has_many :microposts, dependent: :destroy
    validates :name, :email, :password, :password_confirmation, presence: true 
    validates :name, :email, uniqueness: { case_sensitive: false }
    has_secure_password
end
