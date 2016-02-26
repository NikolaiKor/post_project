class BaseUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  #if use local files storage
  # def store_dir
  #   "image/uploads/"
  # end

  # def filename
  #   "#{secure_token(10)}.#{file.extension}"
  # end

  def public_id
    secure_token
  end

  protected
  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end
end