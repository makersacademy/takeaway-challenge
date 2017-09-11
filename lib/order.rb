require_relative 'menu'
require_relative 'takeaway'

class Order

  attr_accessor :chosen_items, :menu

  def initialize(menu = Menu.new)
    #Need to remove this injection
    @menu = menu
    @chosen_items = {}
  end

  def add(item, value)
    fail "This is not available" unless @menu.includes_dish?(item)
    chosen_items[item] = value
  end

  def total
    chosen_items.values.sum
  end

  def empty?
    @chosen_items.empty? ? true : false
  end

  def item_totals
    chosen_items.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end

end
