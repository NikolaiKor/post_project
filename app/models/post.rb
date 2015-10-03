class Post < ActiveRecord::Base
  has_many :comments, as: :target
  validates :title, presence: true, length: {maximum: 45}
  validates :content, presence: true, length: {maximum: 140}
end
