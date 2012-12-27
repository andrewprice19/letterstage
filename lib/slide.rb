require_relative './terminal_formatter'

class Slide
  def initialize(content)
    @content = content
  end

  def render
    markdown = Redcarpet::Markdown.new(TerminalFormatter)
    markdown.render(@content)
  end
end

