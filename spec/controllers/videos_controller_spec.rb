# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  video       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tag_ids     :integer          default([]), is an Array
#
# Indexes
#
#  index_videos_on_id       (id)
#  index_videos_on_tag_ids  (tag_ids)
#

require 'rails_helper'

RSpec.describe VideosController, type: :controller do

end
