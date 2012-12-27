require 'spec_helper'
require 'terminal_formatter'

describe TerminalFormatter do
  def markdown_of(text)
    markdown = Redcarpet::Markdown.new(TerminalFormatter)
    markdown.render(text)
  end

  it "should highlight headings" do
    markdown_of("# Hello World").should == "# Hello World".inverse
  end

  it "should not touch paragraphs" do
    markdown_of("Foobar").should == "Foobar"
  end

  it "should highlight lists" do
    markdown_of("* Foo").should == " * ".foreground(:red) + "Foo\n"
  end
end
