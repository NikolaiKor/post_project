# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :string
#  image      :string           default("no_image.png")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_ids    :integer          default([]), is an Array
#
# Indexes
#
#  index_posts_on_id       (id)
#  index_posts_on_tag_ids  (tag_ids)
#

require 'rails_helper'

RSpec.describe PostsController, type: :controller do

end
