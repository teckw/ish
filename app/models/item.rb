class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :likes, dependent: :destroy
  has_attached_file :ipic
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates_attachment_content_type :ipic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
