require 'twilio-ruby'
require './lib/order'
require './lib/message_confirmation'


class Restaurant
  attr_reader :menu, :order

  LIST_DISHES = [
    { name: "spaghetti", price: 7, quantity: 8 },
    { name: "meatball", price: 6, quantity: 9 },
    { name: "pizza", price: 9, quantity: 10 }]

  def initialize(menu = LIST_DISHES)
    @menu = menu
  end

  def create_order
    @order = Order.new(available_dishes)
  end

  def complete_order
    update_menu
    calculate_bill
    send_confirmation
  end

  def send_confirmation
    msg_cnf = MessageConfirmation.new
    msg_cnf.send_message
  end

  def update_menu
    @order.basket.each do |dish_from_basket|
      appropriate_dish_from_menu = menu.find do |dish_from_menu|
        dish_from_menu[:name] == dish_from_basket[:name]
      end
      appropriate_dish_from_menu[:quantity] -= dish_from_basket[:quantity]
    end
    @menu
  end

  def calculate_bill
    tot = order.basket.inject(0) do|sum, dish|
      sum + (dish[:price] * dish[:quantity])
    end

    order.tot = tot
  end

  def available_dishes
    menu.select { |dish| dish[:quantity] > 0 }
  end

  private
  attr_writer :menu
end
