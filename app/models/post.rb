class Post < ActiveRecord::Base
  belongs_to :target, polymorphic: true
end
