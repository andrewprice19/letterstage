require 'spec_helper'
require 'slide'
require 'slide_deck'

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
