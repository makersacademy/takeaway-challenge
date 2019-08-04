require './lib/dishes.rb'

class Order

  def initialize
  @customer_order = []

  end

  def list_dishes
    counter = 0

    Dishes.list.map do |dish|
      counter += 1
      "#{counter}: #{dish.dish_name}"
    end
  end

  def select_dish(dish_number)
    if Dishes.list[dish_number -1].available
      @customer_order << Dishes.list[dish_number -1]
    else 
      puts "Sorry this dish is not available."  
    end  
  end

  def order_summary
    @customer_order.map do |dish|
      "#{dish.dish_name}: £#{dish.price}"
    end
  end

  # def send_text

  # end 
end

