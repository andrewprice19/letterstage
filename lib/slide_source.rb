require_relative './slide'

class SlideSource
  attr_reader :slide_dir, :slides

  def initialize(dir)
    @slide_dir = dir
    @slides = []

    slide_files = []

    Dir.foreach(@slide_dir) do |file_name|
      next unless file_name.match '(.)+\.md'
      slide_files << file_name
    end

    slide_files = slide_files.sort
    slide_files = slide_files.map { |file_name| slide_dir + file_name }

    slide_files.each do |slide_path| 
      @slides << Slide.new(File.read(slide_path))
    end
  end

  def each(&block)
    slides.each(&block)
  end
end
