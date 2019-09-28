class Order

  attr_reader :items

  def initialize(menu)
    @items = {}
    @menu = menu
  end

  def add(item, quantity)
    fail NoItemError, "#{item.capitalize} is not a valid menu item" unless menu.is_available?(item)
    items[item] = quantity
  end

  private

  attr_reader :menu

end

class NoItemError < StandardError; end
