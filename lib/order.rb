require_relative "./menu.rb"

class Order
  attr_reader :bill

  def initialize
    @bill = []
    @menu = Menu.new
  end

  def add(dish_name, amount)
    @menu.menu_checker(dish_name)
    bill.push(dish: @menu.get_name(dish_name), price: amount * @menu.get_price(dish_name) )
  end

  def show_menu
    menu.print_menu_dishes
  end

end
