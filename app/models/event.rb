class Event < ActiveRecord::Base
  #attr_accessible :title, :address, :started_at, :image
  has_many :comments, as: :target
  mount_uploader :image, PictureUploader
  validates :address, presence: true, length: {maximum: 140}
  validates :title, presence: true, length: {maximum: 45}
  validates :started_at, presence: true
end
