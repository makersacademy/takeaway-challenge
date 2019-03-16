class Order
  def initialize(menu)
    @menu_items = menu
  end

  def place(order_list, total_cost)
    order_cost = 0
    order_list.each do |item|
      @menu_items.each do |dish|
        if dish.description.include?(item[:item])
          order_cost += (dish.price * item[:quantity])
        end
      end
    end
    check_total(order_cost, total_cost)
  end

  def check_total(order_cost, total_cost)
    return "order placed" if order_cost == total_cost
    raise "order cost does not match expected cost"
  end
end
