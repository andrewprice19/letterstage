require_relative './slide_deck'
require_relative './screen'
require_relative './slide_source'

require 'terminfo'
require 'io/console'

class Letterstage
  attr_reader :deck, :screen, :slide_dir

  def initialize(args)
    slide_store = SlideSource.new(args[0])
    @deck = SlideDeck.new(slide_store)
    
    width, height =  TermInfo.screen_size 
    @screen = Screen.new(height, width)
  end

  def run
    next_slide

    loop do
     case $stdin.getch
     when "n" then next_slide
     when "p" then previous_slide 
     when "q" then break
     end
   end
  end

  private

  def next_slide
    puts screen.render(deck.next)
  end

  def previous_slide
    puts screen.render(deck.prev)
  end
end

puts Letterstage.new(['/Users/shostakovich/presentation/']).run
