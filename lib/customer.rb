require_relative './restaurant'
require_relative './order'

class Customer

  attr_reader :bank_account
  attr_reader :telephone
  attr_accessor :hungry

  ERROR_MESSAGES = {
    not_enough_money_for_order: 'Sorry, you do not have enough money to pay for order'
  }.freeze

  INITIAL_CASH_AMOUNT = 100

  def initialize(status = false,
    bank_account = INITIAL_CASH_AMOUNT,
    telephone = '+4488888888')
    @hungry = status
    @bank_account = bank_account
    @telephone = telephone
  end

  def place_an_order(restaurant)
    restaurant.show_menu
    return unless hungry
    order = restaurant.take_an_order
    if order.nil?
      puts "Order is not placed"
      return
    else
      pay_an_order(order, restaurant)
    end
  end

  private

  def pay_an_order(order, restaurant)
    raise ERROR_MESSAGES[:not_enough_money_for_order] if order.total_price > bank_account
    @bank_account -= order.total_price
    restaurant.receive_money(order.total_price, self)
  end
end
