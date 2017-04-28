require_relative 'menu'
require 'twilio-ruby'

class Order

  PRICE = 2.00

  attr_reader :order_items

  def initialize
    @order_items = []
    @order_price = 0
  end

  def select_dish(from_menu)
    raise 'That item is not on the menu' unless Menu::MENU.include?(from_menu)
    @order_items << from_menu
    @order_price += PRICE
  end

  def price_check
    @order_price
  end

  def confirm_order
    text_customer
  end

  private

  def text_customer
    account_sid = 'AC3b3b543d39c56bbaeadf9160caa56a74'; auth_token = '7ebfd33f1c506e440400bca57d164d47'; @client = Twilio::REST::Client.new account_sid, auth_token; @client.account.messages.create(from: '+442003331035', to: '+447778392599', body: "Thank you! Your order was placed and will be delivered before #{Time.now + (60 * 60)}")
  end
end
