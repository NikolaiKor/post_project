class Comment < ActiveRecord::Base
  belongs_to :target, polymorphic: true
  validates :author_name, :author_email, presence: true, length: {maximum: 45}
  validates :content, presence: true, length: {maximum: 140}
  validates :target_type, presence: true, length: {maximum: 30}
  validates :target_id, presence: true, numericality: {only_integer: true, greater_than: 0}
end
