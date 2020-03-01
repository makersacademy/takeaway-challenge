require_relative 'takeaway'

class Order

  attr_reader :items, :menu

  def initialize(menu:)
    @items = {}
    @menu = menu
  end

  def add_item(item, qty)
    @menu.include?(item) ? @items[item] = qty : raise("Sorry, #{item} is not available today")
  end

  def order_total
    sum_items
  end


  private

  def sum_items
    items.map do |item, qty|
      menu.price(item) * qty
    end.sum
  end

end
