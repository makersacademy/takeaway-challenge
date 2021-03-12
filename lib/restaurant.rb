require 'menu'

class Restaurant
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def design_dish(name, price)
    @menu.add_to_menu(name, price)
  end

  def see_menu
    list = @menu.dishes.map do |dish|
      "#{dish.name}: #{dish.price}\n"
    end
    list.join
  end

end
