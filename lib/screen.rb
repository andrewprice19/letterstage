class Screen
  def initialize(width, height, deck)
    @width = width
    @height = height
    @deck = deck
  end

  def render
    system('clear')
    slide = @deck.next

    slide = align_horizontaly(slide)
    align_verticaly(slide)
  end

  private

  def align_verticaly(slide)
    padding = ""
    
    vertical_padding = (@height - line_count(slide)) / 2
    vertical_padding.times do
      padding += "\n"
    end
    padding + slide + padding
  end

  def line_count(slide)
    slide.split("\n").count
  end

  def align_horizontaly(slide)
    lines = slide.split("\n")
    longest_line = lines.max {|a,b| a.length <=> b.length } 

    horizontal_padding = (@width - longest_line.length) / 2
    padding = ''
    horizontal_padding.times do
      padding += ' '
    end

    lines.map do |line|
      padding + line
    end.join("\n")
  end
end
