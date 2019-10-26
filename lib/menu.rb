class Menu
  def initialize
    @contents = []
  end

  def add_dish(dish)
    @contents << dish
  end

  def print_contents
    formatted_menu = ''
    if @contents.length.positive?
      formatted_menu = format_first + format_last
    end
    formatted_menu
  end

private

  def format_first
    formatted_items = ''
    x = 0
    while x < @contents.length - 1
      formatted_items += (x + 1).to_s + ' ' + @contents[x].pretty_format + ', '
      x += 1
    end
    formatted_items
  end

  def format_last
    @contents.length.to_s + ' ' + @contents.last.pretty_format
  end
end
