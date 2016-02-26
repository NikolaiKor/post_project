# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  address    :string
#  started_at :datetime
#  image      :string           default("no_image.png")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_ids    :integer          default([]), is an Array
#
# Indexes
#
#  index_events_on_id       (id)
#  index_events_on_tag_ids  (tag_ids)
#

class Event < ActiveRecord::Base
  #attr_accessible :title, :address, :started_at, :image
  has_many :comments, as: :target
  has_many :tags

  mount_uploader :image, PictureUploader

  validates :image, file_size: { less_than: 5.megabytes.to_i }
  validates :address, presence: true, length: {maximum: 140}
  validates :title, presence: true, length: {maximum: 45}
  validates :started_at, presence: true
end
