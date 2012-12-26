#jp2a --width=50 --height=30 --grayscale -b


describe ImageConverter do
  it 'converts a image' do
    converter = ImageConverter.new('/Users/shostakovich/face.jpg')
    converted_image = converter.convert(50, 50).length == 2500
  end
end
