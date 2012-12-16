require 'spec_helper'
require 'slide'

describe Slide do
  it 'highlights the heading' do
    slide = Slide.new('# Foo bar baz')
    slide.render.should == "\e[7m# Foo bar baz\e[0m"
  end

  it 'just renders all the rest' do
    slide = Slide.new('* lorem\n* ipsum')
    slide.render.should == '* lorem\n* ipsum'
  end
end
