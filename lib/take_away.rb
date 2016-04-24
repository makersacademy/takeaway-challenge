require_relative 'order'
require_relative 'messenger'
class TakeAway
  attr_reader :menu, :order, :messenger

  def initialize (menu:, order: nil, messenger: nil, config:)
    @menu = menu
    @order = order || Order.new(menu)
    @messenger= messenger || Messenger.new(config)
  end
  def show_menu
    menu.list_menu
  end

  def place_order(selected_dishes)
    select_dishes(selected_dishes)
    messenger.send
    order.total
  end

  def checkout
    order.total
  end

private

def select_dishes(selected_dishes)
  selected_dishes.each do |dish, quantity|
    order.add(dish,quantity)
  end
end


end
