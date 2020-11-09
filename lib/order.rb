require_relative 'menu'
require_relative 'message'

class Order

  attr_reader :selected_items, :menu, :total

  def initialize
    @menu = Menu.new
    @selected_items = []
  end

  def see_menu
    @menu.view_menu
  end

  def select(dish_name, quantity)
    dish = @menu.item_available?(dish_name)
    add_to_order(dish, quantity)
  end

  def total
    @total = 0
    @selected_items.map { |key| hash[key] }.compact.reduce(:+)
  end

  def place_order(phone)
    @message = Message.new
    @message.confirmation
  end

private

def add_to_order(dish, quantity)
  quantity.times { @selected_items << dish }
end

def hash
  @hash = @menu.menu
end

end
