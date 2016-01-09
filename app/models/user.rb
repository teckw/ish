class User < ActiveRecord::Base
	has_secure_password
	belongs_to :location
	has_many :items, dependent: :destroy
	has_many :likes, dependent: :destroy
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true, length: { in: 2..20 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :password, presence: true, length: { in: 8..30 }
end
