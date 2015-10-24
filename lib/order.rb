require_relative 'menu'

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu)
    @basket = []
    @menu = menu.new
  end

  def add_items(item_num, quantity, sum)
    basket << {item_num: item_num, quantity: quantity, total: sum}
  end

  def view_menu
    @menu.list_items
  end
end