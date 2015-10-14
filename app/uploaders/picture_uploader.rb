class PictureUploader < BaseUploader

  def extension_white_list
    %w(bmp png jpg gif jpeg)
  end
end