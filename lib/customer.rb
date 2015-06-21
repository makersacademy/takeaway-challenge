require_relative 'menu'

class Customer
  attr_reader :menu, :order
  def initialize (menu)
    @order = {}
    @menu = menu.show_menu
    @total_price = 0
  end

  def add_item (item, number=1)
    if pizza_already_in_order?(item)
      current_total = order[item]
      order[item] = current_total.to_i+ menu[item]*number
    else
      order[item] = @menu[item]*number
    end
    order
  end

  def remove_item (item, number =1)
    if order[item] > menu[item]
      add_item(item, -1*number)
    else
      @order.delete(item)
    end
    remove_zero_items_from_order(item)
  end

  def remove_zero_items_from_order(item)
    if order[item] ==0
      @order.delete(item)
    end
  end

  def pizza_already_in_order? (item)
    @order.keys.include?(item)
  end


end
