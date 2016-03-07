# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 15}

  def self.get_tags(ids)
    Tag.where(' ARRAY[id] <@ ARRAY[?]', Array.wrap(ids).map(&:to_i)) unless ids.nil? || ids.empty?
  end

  def self.cloud
    _cloud = []
    cloud_query { |c| _cloud << {tag: Tag.new(id: c['id'], name: c['name']),
                                 count: c['tags_count'], class: get_class(c['tags_count'].to_i)} }
    _cloud
  end

  def self.get_all
    all = []
    cloud_query { |c| all << {id: c['id'], name: c['name'], count: c['tags_count']} }
    all.sort! { |a, b| b[:count].to_i<=> a[:count].to_i }
  end

  private

  def self.cloud_query
    _result = ActiveRecord::Base.connection.execute('
      SELECT tags.id, tags.name, COUNT(tags.id) AS tags_count FROM tags, content_views
        WHERE tags.id = ANY(content_views.tag_ids)
        GROUP BY tags.id;
    ')
    _result.each { |c| yield(c) }
  end

  def self.get_class(number)
    case number
      when 1..5 then
        'cloud_5'
      when 5..10 then
        'cloud_4'
      when 10..15 then
        'cloud_3'
      when 15..20 then
        'cloud_2'
      else
        'cloud_1'
    end
  end
end
