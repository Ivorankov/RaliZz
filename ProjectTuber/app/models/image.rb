class Image < ActiveRecord::Base
  def self.save(upload)
    name =  upload['image'].original_filename
    directory = "public/images/projects"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['image'].read) }
  end

end
