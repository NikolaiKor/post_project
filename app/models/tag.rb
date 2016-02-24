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
    Tag.where('ARRAY[id] <@ ARRAY[?]', Array.wrap(ids).map(&:to_i))
  end

  def self.cloud
    _result = ActiveRecord::Base.connection.execute('
      SELECT tags.id, tags.name, COUNT(tags.id) AS tags_count FROM tags, content_views
        WHERE tags.id = ANY(content_views.tag_ids)
        GROUP BY tags.id
        ORDER BY tags_count desc;
    ')
    _cloud = []
    _result.each  do |c|
      _buf = c['name']
      _cloud << {tag:Tag.new(id: c['id'], name: c['name']), count:c['tags_count'], class:get_class(c['tags_count'].to_i)}
    end
    _cloud
    # @tags2 = Tag.includes(:content_views).
    #     select('tags.id, tags.name, COUNT(tags.id) AS tags_count FROM tags, content_views
    #     WHERE tags.id = ANY(content_views.tag_ids)').group('tags.id').order(:tags_count).reverse_order
    # print @tags2.inspect
  end

  def self.get_class(number)
    case number
      when 1..2 then 'cloud_5'
      when 2..3 then 'cloud_4'
      when 3..4 then 'cloud_3'
      when 4..5 then 'cloud_2'
      when  number > 5 then 'cloud_1'
    end
  end
end
