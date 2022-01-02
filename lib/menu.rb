require_relative './order'

class Menu
  attr_reader :order
  
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
    @menu.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:name]}: #{item[:price]}"
    end
  end

  def select(*dishes)
    @order.add(@menu, dishes)
  end
end
