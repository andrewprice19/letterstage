require 'spec_helper'
require 'screen'

describe Screen do
  it 'should have a 3 chars border on each side' do
    screen = Screen.new(9, 1)

    screen.render('abc').should == '   abc'
  end


  it 'should have a 3 chars border on each side' do
    screen = Screen.new(7, 2)

    screen.render("abc\ndef").should == "  abc\n  def"
  end

  it 'positions the slide in the middle of the screen' do
    screen = Screen.new(9, 9)
    screen.render('abc').should == "\n\n\n\n   abc\n\n\n\n"
  end
end
