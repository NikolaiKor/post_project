class Tag < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 15}

  def self.get_tags(ids)
    Tag.where('ARRAY[id] <@ ARRAY[?]', Array.wrap(ids).map(&:to_i))
  end
end
