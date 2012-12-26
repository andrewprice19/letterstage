require 'slide_source'

describe SlideSource do
  let(:source) { SlideSource.new(File.dirname(__FILE__)+ "/examples/") }
  
  let(:read_slides) do
    slides = []
    source.each { |s| slides << s.render }
    slides  
  end

  it 'does read the slides from the disk' do
    read_slides.length == 3
  end

  it 'reads them in alphabetical order' do
    read_slides == ['slide1', 'slide2', 'slide3'] 
  end
end
