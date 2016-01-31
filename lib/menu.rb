class Menu

  def initialize
    @menu_list = {:steak => 15, :chips => 5, :pizza =>7,
    :lasagna =>12, :chicken => 10, :sushi => 14}
  end

  def food
    menu_string = "\nMenu\n"
    @menu_list.each {|key,value|
      menu_string = menu_string + "#{key}, #{value}\n"
    }
    menu_string = menu_string + "To place an order please reply with the food item and quantity in the following format (example): \n  pizza 3, steak, chips 2 ... etc."
    menu_string.clone
  end

  def price(item,amount)
    cost = 0
    cost += (@menu_list[item]*amount)
  end

  def create_receipt(order)
    total_cost = 0
    order.each {|food,quantity|
      total_cost += price(food,quantity)
    }
    total_cost
  end


end
