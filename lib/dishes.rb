require_relative "order"

class Dishes
  attr_reader :menu, :current_order
  def initialize
    @current_order
    @menu = [{item: "Pizza", price:7},
      {item:"Fried Rice", price: 3 },
      {item: "Burger and Chips", price: 7},
      {item: "Fish and Chips", price: 8},
      {item: "Chips", price: 2}



      ]
  end

  def see_menu
    @menu.each { |item|
      puts "#{item[:item]} - £#{item[:price].to_s}"
    }
  end

  def create_order(current_order = Order.new)
    @current_order = current_order
    puts "Please add to this order by using add_to_order(ITEM, quantity) "
  end

  def add_to_order(item, quantity)
    @current_order.order << {item: item, quantity: quantity}
  end

end
