require_relative 'menu'
require_relative 'order'

class Takeaway


  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def view_menu
    menu.view
  end

  def place_order(dishes)
    dishes.each do |dish, quantity| 
      order.add(dish, quantity)
    end
    order.total
  end

  private

  attr_reader :menu, :order

end

menu_select = {
  "Pizza" => 12.50,
  "Burger" => 10,
  "Curry" => 8
}

  
  menu = Menu.new(menu_select)

  dishes = {}

  loop do
    p "What would you like to order? Type exit when finished"
    dish = gets.chomp
    break if dish == "exit"
    p "Please enter quantity"
    quantity = gets.to_i
    dishes[dish] = quantity
  end

    
Takeaway.new(menu: menu).place_order(dishes)

