# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  address    :string
#  started_at :datetime
#  image      :string           default("no_image.png")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_ids    :integer          default([]), is an Array
#
# Indexes
#
#  index_events_on_id       (id)
#  index_events_on_tag_ids  (tag_ids)
#

module EventsHelper
  def new(params)

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
