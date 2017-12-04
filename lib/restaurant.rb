require 'twilio-ruby'
require './lib/order'
require './lib/message_confirmation'
require './lib/menu'


class Restaurant
  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def print_menu
    menu.list
  end

  def create_order
    @order = Order.new(menu.available_dishes)
  end

  def complete_order
    update_menu
    calculate_bill
    send_confirmation
  end

  def update_menu
    @order.basket.each { |dish_from_basket| menu.update_item(dish_from_basket) }
    @menu
  end

  def calculate_bill
    total = order.basket.inject(0) do|sum, dish|
      sum + (dish[:price] * dish[:quantity])
    end

    order.tot = total
  end

  def send_confirmation
    msg_cnf = MessageConfirmation.new
    msg_cnf.send_message
  end

  private
  attr_writer :menu
end
