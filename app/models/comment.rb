# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  author_name  :string
#  author_email :string
#  content      :string
#  target_id    :integer
#  target_type  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_comments_on_id                         (id)
#  index_comments_on_target_type_and_target_id  (target_type,target_id)
#

class Comment < ActiveRecord::Base
  #attr_accessible :author_name, :content, :target_type, :target_id
  belongs_to :target, polymorphic: true

  validates :author_name, :author_email, presence: true, length: {maximum: 45}
  validates :content, presence: true, length: {maximum: 140}
  validates :target_type, presence: true, length: {maximum: 30}
  validates :target_id, presence: true, numericality: {only_integer: true, greater_than: 0}
end
