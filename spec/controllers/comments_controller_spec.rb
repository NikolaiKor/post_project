# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  author_name  :string
#  author_email :string
#  content      :string
#  target_id    :integer
#  target_type  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_comments_on_id                         (id)
#  index_comments_on_target_type_and_target_id  (target_type,target_id)
#

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

end
