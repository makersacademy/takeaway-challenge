require_relative 'takeaway'

class Order

  attr_reader :customer_order, :item

  def initialize
    @customer_order = Hash.new(0)
    @menu = Takeaway::MENU
  end

  def add_item(item, quantity)
    fail "Item is not on the menu." unless @menu.include?(item)
    customer_order[item] += quantity
  end
end
