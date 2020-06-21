require './lib/dish'
require './lib/order'

class Takeaway
  attr_reader :menu

  def initialize
    @menu = []
    @orders = []
  end

  def add(dish)
    @menu << { name: dish, available: true }
  end

  def list_available
    number = 1
    @menu.each do |dish| 
      if dish[:available] == true 
        (puts "#{number}\. #{dish[:name].name} \£#{dish[:name].price}")
      end
      number += 1
    end
  end

  def available(dish)
    @menu.each { |line| 
      if line[:name] == dish
        line[:available] = false
      end 
    }
  end

  def order(order = Order)
    puts "What would you like to order? (please separate items with a comma)"
    food = gets.chomp
    array = food.split(",").collect(&:strip)
    @orders << order.new(array)
    puts "Your order is order number #{@orders.count-1}"
  end
end
