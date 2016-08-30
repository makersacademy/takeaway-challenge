class Order

  attr_reader :items

  def initialize(menu)
    @items = {}
    @menu = menu
  end

  def add(item, quantity)
    fail "#{item.capitalize} is not on the menu!" unless menu.has_item?(item)
    items[item] = quantity
  end

  def total
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
