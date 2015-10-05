class Video < ActiveRecord::Base
  #attr_accessible :video, :title, :description
  has_many :comments, as: :target
  mount_uploader :video, VideoUploader
  validates :title, presence: true, length: {maximum: 45}
  validates :description, presence: true, length: {maximum: 140}
end
