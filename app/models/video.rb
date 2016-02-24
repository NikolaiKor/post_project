# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  video       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tag_ids     :integer          default([]), is an Array
#
# Indexes
#
#  index_videos_on_id       (id)
#  index_videos_on_tag_ids  (tag_ids)
#

class Video < ActiveRecord::Base
  #include Taggable

  has_many :comments, as: :target
  has_many :tags

  mount_uploader :video, VideoUploader
  validates :title, presence: true, length: {maximum: 45}
  validates :description, presence: true, length: {maximum: 140}
end
