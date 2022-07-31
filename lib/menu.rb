require_relative './order'

class Menu  
  def initialize
    @menu = [
      { name: "Beef burger", price: 14 },
      { name: "Chicken burger", price: 12 },
      { name: "Hot dog", price: 11 },
      { name: "Fries", price: 4 },
      { name: "Soft drink", price: 3 },
      { name: "Milkshake", price: 5 }
    ]

    @order = Order.new
  end

  def view
    print_menu
  end

  def select(dishes)
    add_to_order(dishes)
    @order
  end

  private

  def print_menu
    @menu.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:name]}: #{item[:price]}"
    end
  end

  def add_to_order(dishes)
    dishes.each do |dish|
      @order.add(@menu[dish - 1])
    end
  end
end
