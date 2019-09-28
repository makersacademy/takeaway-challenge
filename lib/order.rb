class Order

  attr_reader :items

  def initialize(menu)
    @items = {}
    @menu = menu
  end

  def add(item, quantity)
    fail NoItemError,
    "#{item.capitalize} is not a valid menu item" unless menu.available?(item)
    items[item] = quantity
  end

  def order_total
    item_totals.inject(:+)
  end

  private

  attr_reader :menu

  def item_totals
    items.map do |item, quantity|
      menu.price(item) * quantity
    end
  end

end

class NoItemError < StandardError; end
