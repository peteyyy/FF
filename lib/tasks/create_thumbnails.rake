desc "Creates and saves 300x300 thumbnail of first page of pdf file."
task :create_thumbnails => :environment do
  require "RMagick"
  include Magick

  Form.where(thumbnail: nil).find_each do |form|
    pdf_path = form.location + "[0]"
    pdf = ImageList.new(pdf_path)
    thumb = pdf.scale(300, 300)
    thumb.write ("/Users/alexpetersen/Desktop/FormFinder/FormFinderApp/app/assets/images/thumbnails/#{form.document}.png")
    form.thumbnail = "thumbnails/#{form.document}.png"
    form.save
  end
end