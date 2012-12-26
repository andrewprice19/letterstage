class SlideDeck
  def initialize(slide_store)
    @slides = []
    slide_store.each { |slide| add_slide(slide) }
    @slides.map!(&:render)

    @current_slide = 1
  end

  def next
    slide = @slides[@current_slide - 1]
    @current_slide += 1 if @current_slide != @slides.length
    slide
  end

  def prev
    @current_slide -= 1 if @current_slide != 1
    slide = @slides[@current_slide - 1]
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
