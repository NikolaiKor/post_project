#require '../../app/uploaders/picture_uploader'
class Post < ActiveRecord::Base
  attr_accessible :image, :title, :content
  has_many :comments, as: :target
  mount_uploader :image, PictureUploader
  validates :title, presence: true, length: {maximum: 45}
  validates :content, presence: true, length: {maximum: 140}
end
