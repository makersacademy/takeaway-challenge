require 'menu'

class Order
  attr_reader :menu, :whiskies

  def initialize(menu)
    @whiskies = {
      :Lagavulin_16yo_Islay => 49.50,
      :Laphroaig_10yo_Islay => 30.00
    }
    @menu = menu
  end

  def add(item, quantity)
    raise "Sorry, we don't sell #{item}!" unless whiskies.has_key?(item)
    whiskies[item] = quantity
  end

  def item_totals
    whiskies.map do |item, quantity|
      price(item) * quantity
    end
  end

  def total
    item_totals.inject(:+)
  end
end
