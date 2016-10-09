require_relative 'menu'

class Order

  attr_reader :basket, :menu

  def initialize(item_class = Menu)
    @menu = item_class.new
    @basket = []
  end

  def add_item(item, quantity = 1)
    @basket << {item: item, quantity: quantity}
  end

end
