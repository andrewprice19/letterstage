require 'spec_helper'
require 'screen'

describe Screen do
  it 'should have a 3 chars border on each side' do
    deck = stub(:next => 'abc')
    screen = Screen.new(9, 1, deck)

    screen.render.should == '   abc'
  end


  it 'should have a 3 chars border on each side' do
    deck = stub(:next => "abc\ndef")
    screen = Screen.new(7, 2, deck)

    screen.render.should == "  abc\n  def"
  end

  it 'positions the slide in the middle of the screen' do
    deck = stub(:next => 'abc')
    screen = Screen.new(9, 9, deck)
    screen.render.should == "\n\n\n\n   abc\n\n\n\n"
  end
end
