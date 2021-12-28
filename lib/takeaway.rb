require_relative 'menu'

class Takeaway
  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def display_menu
    puts @menu.print_menu
  end

  def order
    "2 x Soup, 1 x Bread"
  end

end

# x = Takeaway.new(Menu.new({Soup: 2, Bread: 1}))
# x.display_menu