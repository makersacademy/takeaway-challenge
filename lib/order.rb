# frozen_string_literal: true

class Order
  attr_reader :basket, :menu
  def initialize(menu)
    @basket = {}
    @menu = menu
  end

  def add_item(item, number)
    raise 'Item not on menu' if menu.item_unavailable?(item)

    basket[item] = number
  end

  def basket_total
    basket.map { |item, quantity| menu.get_price(item) * quantity }.sum
  end
end
