require_relative './menu'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def see_menu
    puts @menu.print_menu
  end

  def select(dish,quantity)
    raise "I'm sorry, we don't have that on our menu." if @menu.not_on_menu?(dish)

    get_price(dish)
    "Dish added!"
  end

private

  def get_price(dish)
    @menu.get_price_for(dish)
  end
end
