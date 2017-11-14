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

desc "Creates and saves fullsize pic image of first page of pdf file."
task :create_full_image => :environment do
  require "RMagick"
  include Magick

  Form.where(full_image: nil).find_each do |form|
    pdf_path = form.location + "[0]"
    pdf = ImageList.new(pdf_path)
    full = pdf.scale(825,1057)
    pdf.write ("/Users/alexpetersen/Desktop/FormFinder/FormFinderApp/app/assets/images/forms/full/#{form.document}.png")
    form.full_image = "forms/full/#{form.document}.png"
    form.save
  end
end