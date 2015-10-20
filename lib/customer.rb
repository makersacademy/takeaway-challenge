require_relative 'menu'

class Customer

  include Menu

  attr_reader :order_array

  def see_menu
    @menu
  end

  def choice_validation(item)
    @menu.has_key?(item) ? :available : :unavailable
  end

  def price(item)
    price = @menu.fetch(item)
    "£#{price}"
  end

  def order(*items)
    order_array = []
    items.each do |dish|
      if choice_validation(dish) == :available
        order_array << dish
      else
       return choice_validation(dish)
      end
      order_array
    end
  end

  def total(order)
    @order = order_array
    items = order.select 
    price = menu[order]
  end

end
