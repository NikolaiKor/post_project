require_relative '../uploaders/base_uploader'
class PictureUploader < BaseUploader

  def extension_white_list
    %w(bmp png jpg gif jpeg)
  end
end