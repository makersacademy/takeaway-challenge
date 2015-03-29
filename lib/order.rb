class Order
  attr_reader :order
  alias_method :list, :order

  def initialize
    @order = []
  end

  def add item, menu
    unless item_verified?(item, menu)
      fail 'Invalid Dish, Available Dishes in the Menu'
    end
    order << item
  end

  private

  def item_verified? item, menu
    menu.list.include?(item)
  end
end
