require_relative 'menu'
class Order
  def initialize(menu_class = Menu)
    @menu_instance = menu_class.new
    @orders = []
  end

  attr_reader :orders

  def add(item)
    @menu_instance.menu.each do |key, value|
      if item == key
        @orders.push({key => value})
        break
      end
    end
  end

  def remove(item)
    # fail "no items to remove" if @orders == nil
    @orders.each_with_index do |order_item, index|
      if item == order_item.keys[0]
        @orders.delete_at(index)
        break
      end
    end
  end

  def total
    total = 0
    @orders.each do |hash_item|
      total += hash_item.values[0]
    end
    total
  end
end
