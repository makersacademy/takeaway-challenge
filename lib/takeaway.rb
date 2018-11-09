require_relative 'dish'

class Takeaway

  def initialize
    @menu = {}
  end

  def show_menu
    @menu
  end

  def add_dish(dish)
    @menu[dish.name] = dish.price
  end

  def create_order(*order_array)
    @customer_total = order_array.pop
    order_hash = Hash[*order_array.flatten(1)]
    fail "Not on the menu" unless menu_has_items?(order_hash)
    fail "Total not correct" if (@customer_total != order_total(order_hash))
  end

  def order_total(order_hash)
    @total = 0
    order_hash.each {|key, value|
      value.times {
        @total += @menu[key]
      }
    }
    @total
  end


  def make_order(*dish)
    customer_order = {}
    dish.each { |dish_name|
      fail "Not on the menu" unless @menu.has_key? dish_name
      customer_order.store(dish_name, (@menu[dish_name]))
    }
    customer_order
  end

  def menu_has_items?(order_hash)
    order_keys = order_hash.keys
    (order_keys - @menu.keys).empty?
  end

end
