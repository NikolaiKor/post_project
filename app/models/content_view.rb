class ContentView < ActiveRecord::Base
  self.table_name = 'content_views'
  self.primary_key = 'id'

  scope :any_tags, -> (tags) { where('tag_ids && ARRAY[?]', Array.wrap(tags).map(&:to_i)) }

  def readonly?; true end

  def before_destroy; raise ActiveRecord::ReadOnlyRecord end
end