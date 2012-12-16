require 'spec_helper'
require 'slide'

class SlideDeck
  include Enumerable

  def initialize(slide_store)
    @slides = []
    slide_store.each { |slide| add_slide(slide) }
    @slides.map!(&:render)
    @slides.freeze

    @current_slide = 1
  end

  def next
    slide = @slides[@current_slide - 1]
    @current_slide += 1 if @current_slide != @slides.length
    slide
  end

  def length
    @slides.length
  end

  private

  def add_slide(slide)
    @slides << slide
  end

end

describe SlideDeck do
  let(:slide_source){ [Slide.new('123'), Slide.new('abc')] }
  let(:deck) { SlideDeck.new(slide_source) }

  it 'contains several slides' do
    deck.length == slide_source.length
  end

  it 'can return the next slide' do
    deck.next.should == '123'
    deck.next.should == 'abc'
  end

  it 'does not step over the last slide' do
    deck.next
    deck.next
    deck.next.should == 'abc'
  end
end
