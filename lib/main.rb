#Understands responsibility to manage inital section of customer journey
require_relative "italian"
require_relative "basket"
require_relative "text"

class Main

  attr_reader :menus, :print_menu, :chosen_menu

  menus = ["Italian"]

  def initialize
    @basket = Basket.new
  end

  def show_menu(type = Italian)
    type.new.menu.each.with_index(1) do |(item,price), index|
      puts "#{index}.#{item} --- £#{price}"
    end
  end

  def select_dish(dish)
    @basket.add_to_cart(dish)
  end

  def view_basket
    @basket.basket_status
  end

  def place_order
    Text.new.send
  end

end
