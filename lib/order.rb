require_relative 'menu'

class Order

  attr_reader :final_order

  def initialize(menu)
    @menu = menu
    @final_order = []
  end

  def add_order(dish_name, quantity)
    fail 'Sorry, #{dish} is not availble' unless @menu.has_dish?(dish_name) 
    if @menu.has_dish?(dish_name)
      dish_obj = @menu.get_dish_obj(dish_name)
      @final_order.push({dish: dish_obj, quantity: quantity})
    end
  end

  def final_bill
    sum = 0
    @final_order.each do |item|
      sum += (item[:dish].price * item[:quantity])
    end
    puts "Thank you! Your order was placed and will be delivered within 1 hour"
    return sum
  end

end