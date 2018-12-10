require_relative "menu"

class Order

  attr_reader :basket, :item, :quantity, :basket_total

  def initialize
    @menu = Menu.new
    @basket = []
    @item = item
    @quantity = quantity
    @basket_total = 0
  end

  def add_item(item, quantity)
    @item = item
    @quantity = quantity
  end

  def to_basket
    item_cost = @menu[@item]
    @basket << ( quantity * item_cost )
  end

  def order_total
    @basket.each { |item| @basket_total += item }
    @basket_total
  end

end
