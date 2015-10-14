class Video < ActiveRecord::Base
  include Taggable

  has_many :comments, as: :target
  has_many :tags

  mount_uploader :video, VideoUploader
  validates :title, presence: true, length: {maximum: 45}
  validates :description, presence: true, length: {maximum: 140}
end
