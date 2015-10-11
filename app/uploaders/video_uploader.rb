class VideoUploader < BaseUploader

  def extension_white_list
    %w(mkv flv avi wmv mp4 mpg mpeg m4v 3gp)
  end
end