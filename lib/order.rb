class Order
  attr_reader :items

  def initialize(menu_instance = menu)
    @items = Hash.new(0)
    @menu = menu_instance
  end

  def add(dish, quantity)
    items[dish] += quantity
  end

  # def order_total
  # end
  #
  # def finalize_order
  # end

end
