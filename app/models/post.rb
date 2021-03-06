# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :string
#  image      :string           default("no_image.png")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_ids    :integer          default([]), is an Array
#
# Indexes
#
#  index_posts_on_id       (id)
#  index_posts_on_tag_ids  (tag_ids)
#

class Post < ActiveRecord::Base

  has_many :comments, as: :target

  mount_uploader :image, PictureUploader

  validates :image, file_size: { less_than: 5.megabytes.to_i }
  validates :title, presence: true, length: {maximum: 45}
  validates :content, presence: true, length: {maximum: 500}

  def style
    _s = ''
    settings.each do|key, value|
      _s = _s + key.to_s + ':' + value.to_s + ', '
    end
    #_s[0] = ''
    #_s[1] = ''
    _s[_s.length] = ''
    _s[_s.length-1] = ''
    _s[_s.length] = ''
    _s
  end
end
