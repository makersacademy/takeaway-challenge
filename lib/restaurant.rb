require './lib/order'

class Restaurant
  attr_reader :menu, :order

  LIST_DISHES = [
    { name: "spaghetti", price: 7, quantity: 8 },
    { name: "meatball", price: 6, quantity: 9 },
    { name: "pizza", price: 9, quantity: 10 }]

  def initialize(menu = LIST_DISHES)
    @menu = menu
  end

  def available_dishes
    menu.select { |dish| dish[:quantity] > 0 }
  end

  def create_order
    @order = Order.new(available_dishes)
  end

  private
  attr_writer :menu

end
