class Order
  def initialize
    @dishes = []
  end

  def check_order
    return nil if dishes.empty?

    cost_summary + "\nTOTAL: £#{format("%<num>0.2f", num: total_price)}"
  end

  def add_dishes_to_order(menu, *dish_numbers)
    raise 'Order has already been submitted.' if @submitted

    dish_numbers.each { |dish_number|
      dishes << menu.get_dish(dish_number)
    }
  end

  def submit_order
    raise 'Order has already been submitted.' if @submitted

    @submitted = true
  end

  private
  
  attr_reader :dishes
  
  def total_price
    dishes.reduce(0) { |sum, dish|
      sum + dish.price
    }
  end

  def cost_summary
    dishes.map { |dish|
      dish.to_s
    }.join("\n")
  end
end
