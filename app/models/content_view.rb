# == Schema Information
#
# Table name: content_views
#
#  id          :integer          primary key
#  title       :string
#  type        :text
#  image       :string
#  content     :string
#  description :text
#  started_at  :datetime
#  address     :string
#  tag_ids     :integer          is an Array
#  created_at  :datetime
#  updated_at  :datetime
#

class ContentView < ActiveRecord::Base
  self.table_name = 'content_views'
  self.primary_key = 'id'

  scope :any_tags, -> (tags) { where('tag_ids && ARRAY[?]', Array.wrap(tags).map(&:to_i)) }

  def readonly?; true end

  def before_destroy; raise ActiveRecord::ReadOnlyRecord end
end
