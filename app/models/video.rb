class Video < ActiveRecord::Base
  has_many :comments, as: :target
  validates :title, presence: true, length: {maximum: 45}
  validates :description, presence: true, length: {maximum: 140}
end
