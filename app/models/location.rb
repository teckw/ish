class Location < ActiveRecord::Base
	has_many :users, dependent: :destroy
	has_many :items, dependent: :destroy
end
