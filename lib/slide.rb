require 'rainbow'

class Slide
  def initialize(content)
    @content = content
  end

  def render
    @content.sub(/^#.*$/) {|match| match.inverse}
  end
end

