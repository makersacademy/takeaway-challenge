require_relative 'order'
require_relative 'menu'
require_relative 'text'
require_relative 'takeaway_display'

class TakeAway
  attr_reader :menu, :order, :text
  attr_reader :dish_list

  def initialize(menu = nil, order = nil, text = nil)
    @dish_list = {chicken: 1.20, donner: 1.99, chicken_tikka: 2.99 }
    menu_placeholder = Menu.new(dish_list)
    @order = order || Order.new(menu_placeholder)
    @menu = menu || menu_placeholder
    @text = text

  end



  def display_menu
    @menu.display_menu
  end

  def receive_order(dishes)
    dishes.each do |dish, quantity|
    order.place_order(dish,quantity)
    end
    display_total
    # text.deliver_text
  end

  def display_total

    order.order_total
  end

private




end
