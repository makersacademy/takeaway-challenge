require_relative './menuitems'

class Order
  attr_reader :order, :items

  def initialize(items =  nil)
    @order = {}
    @items = items || MenuItems.new
  end

  def add(item, amount)
    fail "Sorry #{item} is out of stock" unless items.has_item?(item)

    order[item] = amount
  end

  def basket
    calculate_basket.inject(:+)
  end

  def calculate_basket
    order.map do |item, amount|
      items.price(item) * amount
    end
  end
end
