class Post < ActiveRecord::Base

  has_many :comments, as: :target

  mount_uploader :image, PictureUploader
  validates :title, presence: true, length: {maximum: 45}
  validates :content, presence: true, length: {maximum: 500}
end
