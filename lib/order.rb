class Order
  attr_reader :order, :menu

  def initialize(menu)
    @order = []
    @menu = menu
  end

  def add_dish(dish)
    @order << menu.dish_list.find { |menu_item| menu_item.name == dish }
  end

  def total_price
    @order.map(&:price).sum
  end

  def check_price(price)
    price == total_price
  end
end
