
class Order

  attr_reader :items, :menu
  attr_writer :items

  def initialize(menu)
    @items = Hash.new(0)
    @status = :new
    @menu = menu
  end

  def add_dish(dish, quantity = 1)
    valid_dish?(dish)
    @items[dish] = 0 unless items[dish]
    @items[dish] += quantity
  end

  def remove_dish(dish)
  end

  def order_total
  end

  def finalize_order
  end

  def valid_dish?(dish)
    @menu.list.each do |menu_item|
      return true if dish == menu_item[:name]
    end
    raise 'Item not found'
  end
  
end
