# == Schema Information
#
# Table name: content_views
#
#  id          :integer          primary key
#  title       :string
#  type        :text
#  description :text
#  started_at  :datetime
#  address     :string
#  tag_ids     :integer          is an Array
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe ContentView, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
