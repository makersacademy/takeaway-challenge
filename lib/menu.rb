# frozen_string_literal: true

class Menu
  def initialize(items)
    @items = items
  end

  def print_items
    @items.map { |dish, value| dish + ": £#{value} \n" }.join
  end

  def item_unavailable?(item)
    @items[item].nil?
  end

  def get_price(item)
    @items[item]
  end
end
