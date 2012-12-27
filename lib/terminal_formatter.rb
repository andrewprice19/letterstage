require 'redcarpet'
require 'rainbow'

class TerminalFormatter < Redcarpet::Render::Base
  def header(text, header_level)
    heading = "# " + text
    heading.inverse
  end

  def paragraph(text)
    text
  end

  def list(contents, list_type)
    contents
  end

  def list_item(text, list_type)
    " * ".foreground(:red) + text
  end
end
