class Order

  attr_accessor :order_summary, :total_cost

  def initialize
    @order_summary = {}
    @total_cost = 0
  end

  def add restaurant, food_item, num=1
    if check_inclusion? restaurant, food_item # r.menu.items.keys.include? food_item
      order_summary[food_item] == nil ? order_summary[food_item] = num : order_summary[food_item] += num
      price = get_price restaurant, food_item
      num.times {self.total_cost += price } # Why was self needed here?? Kicked up error for '+' if not used...
    else
      raise "Invalid menu selection. Please try again."
    end
  end

  def check_inclusion? restaurant, food_item
    restaurant.check_inclusion? food_item
  end

  def get_price restaurant, food_item
    restaurant.get_price food_item
  end

  def display_order

  end

end
