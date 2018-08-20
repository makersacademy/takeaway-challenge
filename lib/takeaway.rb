require 'twilio-ruby'
require_relative 'menu'
require_relative 'sms'

class Takeaway


  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
#    @sms = sms
  end

  def view_menu
    menu.print_menu
  end


  # need to think about what place order will do at the moment it is responsible for sending the text!!!
  def place_order
    account_id
    message
  end


  def add_to_order(dish, quantity)
    fail "#{dish} is not on the menu" unless menu.dishes.has_key?(dish.downcase)
    # write a test to test the downcase capitalize condition
    order[dish] = quantity
  end

  def total
    order_totals.sum
  end

  private

  def order_totals
    order.map do |dish, quantity|
      menu.dishes[dish.downcase] * quantity
    end
  end

  def account_id
    account_sid = "ACe16a4eddf4b5e19a3331831d7df88b9b"
    auth_token = "f6964d00315fe133190e213d9cc775f1"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def message
    @client.messages.create(
      from: +447480537261,
      to: +7968841830,
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )
  end

  def delivery_time
    (Time.now + 3600).strftime("%H:%M")
  end


end
