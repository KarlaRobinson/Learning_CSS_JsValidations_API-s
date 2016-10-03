class PhotoUploader < CarrierWave::Uploader::Base
  # ...
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    # "#{mounted_as}/#{model.id}"
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  storage :file
# Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  version :large do
    process :resize_to_fit => [1024, 768]
  end

  version :medium, :from_version => :large do
    process :resize_to_fit => [800, 600]
  end

  version :small, :from_version => :medium do
    process :resize_to_fit => [240, 180]
  end

  version :thumb, :from_version => :small do
    process :resize_to_fill => [100, 100]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end




