require_relative './slide_deck'
require_relative './screen'
require_relative './slide'

require 'terminfo'

class Letterstage
  def initialize(args)
    @slide_dir = args[0]
  end

  def run
    slides = []
    Dir.foreach(@slide_dir) do |item|
      next unless item.match '(.)+\.md'
      slide_path = @slide_dir + item
      slides << Slide.new(File.read(slide_path))
    end

    deck = SlideDeck.new(slides)
    width, height =  TermInfo.screen_size 

    screen = Screen.new(height, width, deck)
    puts screen.render
  end
end

puts Letterstage.new(['/Users/shostakovich/presentation/']).run
