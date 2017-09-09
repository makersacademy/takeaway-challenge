require_relative 'menu'
require_relative 'takeaway'

class Order

  attr_accessor :chosen_items

  def initialize(menu = Menu.new)
    @menu = menu
    @chosen_items = {}
  end

  def add(item, value)
   fail "This is not available" unless @menu.includes_dish?(item)
   chosen_items[item] = value
  end
end
