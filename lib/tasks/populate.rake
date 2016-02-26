namespace :db do
#   = post_project
#   Training project for Ruby courses from [Fodojo](https://fodojo.com/).
#
#       ===Task:
#       * Rails
#       * Slim
#   * RSpec Tests
#   * Images upload (carrierwave). I can't upload files to heroku, so I use Dropbox integration
# * Tags cloud
# * DataBase view
# * Cache posts by fragment cache
# * I18n
# * STI
#
# ===Gems in project:
# - Slim
# - CarrierWave
# - Kaminari
# - RSpec
# ...
#
# *Database:* PostgreSQL

  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    require 'as-duration'

    TAG_NUMBER = 25

    def image_populate
      %w(v1456443467/no_image.png 9b60954d91f6156b.jpg a57757adc86607c1.jpg 4bb07983ff79ea60.jpg fbd511a6876d6fcc.jpg
        1276e52b79dfeab9.jpg feb9fa8b4ac02e6a.jpg 0e5808c3e7e3e8e7.jpg 88e20cbd6934f295.jpg no_image.png
        6751f1fe859e1c28.jpg d4a2f0b0c2e09d71.jpg nature.gif 04e01a2eeaaf25e2.jpg aaf9c4d220b26d25.jpg
        925645a31abee472.jpg e1c46b9bbdd3e840.jpg 6e1420e20b8b3c76.jpg 8620e94682393020.jpg).sample
    end

    def tag_populate
      arr = Array.new(Faker::Number.between(1, 5)) { Faker::Number.between(1, TAG_NUMBER) }
      '{' +arr.join(', ')+ '}'
    end

    [Post, Event, Tag].each(&:delete_all)

    Tag.populate TAG_NUMBER do |tag|
      tag.name = Faker::Lorem.word
    end

    Post.populate 50 do |post|
      post.title = Faker::Lorem.sentence
      post.content = Faker::Hipster.paragraph
      post.image = image_populate
      post.tag_ids = tag_populate
    end

    Event.populate 50 do |event|
      event.title = Faker::Lorem.sentence
      event.address = Faker::Address.street_address
      event.started_at = Faker::Time.between(5.days.ago, Time.now, :all)
      event.image = image_populate
      event.tag_ids = tag_populate
    end

  end
end