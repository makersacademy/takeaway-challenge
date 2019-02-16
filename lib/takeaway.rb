class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    @menu.print_menu
  end

end

class Menu
  attr_reader :dishes
  def initialize
    @dishes = [{ :dish => "Chicken", :price => "£3.50" },
    { :dish => "Pizza", :price => "£4" }]
  end

  def print_menu
    @dishes.map { |x| x.values.join(" ") }
  end
end
