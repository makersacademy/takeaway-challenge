class OrderProcessor

  def self.process(contents)
    self.run_iteration(contents)
    @full_message = @message + "#{contents.count} Dishes. "\
    "Total: £#{sprintf('%.2f', @order_total)}"
    [@message, @full_message, @order_total]
  end

  def self.run_iteration(contents)
    @message, @full_message, dishes, @order_total = "", "", [], 0
    contents.each { |dish|
      @message += "Dish: #{dish.name} Price: £#{sprintf('%.2f', dish.price)}, "\
      "Quantity: #{contents.count(dish)}\n" unless dishes.include?(dish.name)
      dishes << dish.name
      @order_total += dish.price
    }
    dishes = nil
  end

end
