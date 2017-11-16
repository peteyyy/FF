desc "Creates and saves 300x300 thumbnail of first page of pdf file."
task :create_thumbnails => :environment do
  require "RMagick"
  include Magick

  Form.where(thumbnail: nil).find_each do |form|
    pdf_path = form.location + "[0]"
    pdf = ImageList.new(pdf_path)
    thumb = pdf.scale(300, 300)
    thumb.write ("/Users/alexpetersen/Desktop/FormFinder/FormFinderApp/app/assets/images/forms/thumbnails/#{form.document}.png")
    form.thumbnail = "forms/thumbnails/#{form.document}.png"
    form.save
  end
end

desc "Create/save full size on new forms"
task :create_new_full_image => :environment do
  require "RMagick"
  include Magick

  Form.where(full_image: nil).find_each do |form|
    pdf_path = form.location + "[0]"
    pdf = ImageList.new(pdf_path)
    full = pdf.scale(931,1193)
    full.write ("/Users/alexpetersen/Desktop/FormFinder/FormFinderApp/app/assets/images/forms/full/#{form.document}.png")
    form.full_image = "forms/full/#{form.document}.png"
    form.save
  end
end

desc "Create/save full size on all forms."
task :create_all_full_image => :environment do
  require "RMagick"
  include Magick

  Form.all.each do |form|
    form.full_image = nil
    pdf_path = form.location + "[0]"
    pdf = ImageList.new(pdf_path)
    full = pdf.scale(931,1193)
    full.write ("/Users/alexpetersen/Desktop/FormFinder/FormFinderApp/app/assets/images/forms/full/#{form.document}.png")
    form.full_image = "forms/full/#{form.document}.png"
    form.save
  end
end