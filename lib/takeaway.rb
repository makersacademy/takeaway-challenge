class Takeaway
  # attr_reader :orders_list

  def initialize(menu_instance, order_instance)
    @menu_instance = menu_instance
    @order_instance = order_instance
  end

  def print_menu
    output = ""
    (0..@menu_instance.dishes.length-1).each do |index|
      dish = @menu_instance.dishes[index]
      output += "#{index+1}. #{dish[:name]}: #{dish[:price]}" + "\n"
    end
    return output
  end

  def order(number)
    @order_instance.take_order(number)
  end
end
