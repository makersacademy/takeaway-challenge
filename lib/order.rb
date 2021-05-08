class Order
  def initialize
    @dishes = []
  end

  def check_order
    return nil if all_dishes.empty?
    cost_summary + "\nTOTAL: £#{format("%<num>0.2f", num: total_price)}"
  end

  def add_dishes_to_order(menu, *dish_numbers)
    dish_numbers.each { |dish_number|
      @dishes << menu.get_dish(dish_number)
    }
  end

  private
  
  def all_dishes
    @dishes
  end

  def total_price
    all_dishes.reduce(0) { |sum, dish|
      sum += dish.price
    }
  end

  def cost_summary
    all_dishes.map { |dish|
      dish.to_s
    }.join("\n")
  end
end

