class Post < ActiveRecord::Base

  has_many :comments, as: :target

  mount_uploader :image, PictureUploader
  validates :title, presence: true, length: {maximum: 45}
  validates :content, presence: true, length: {maximum: 500}

  def style
    _s = ''
    settings.each do|key, value|
      _s = _s + key.to_s + ':' + value.to_s + ', '
    end
    #_s[0] = ''
    #_s[1] = ''
    _s[_s.length] = ''
    _s[_s.length-1] = ''
    _s[_s.length] = ''
    _s
  end
end
