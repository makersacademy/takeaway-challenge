require_relative 'list'
require_relative 'printer'
require 'twilio-ruby'

class Takeaway

  attr_reader :user_order
  attr_accessor :total_price
  include Printer

  def initialize(list)
    @menu = list.dish_list
    @user_order = Hash.new
    @total_price = nil
  end

  def show_list
    @menu
  end

  def order_meal(dish, quantity)
      if @menu.has_key?(dish)
        user_order[dish] = [quantity, @menu[dish]]
      else
        raise "Item not in list"
      end
  end



  def send_message(twilio_number, phone_number)
    account_sid = "ACc75b72a0ddcf8149871f9d29e2d6a35f"
    auth_token = "90a709909ee5b6e01d57d4a7696ffadb"
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: twilio_number,
      to:   phone_number,
      body: "Thank you! Your order was placed and will be delivered before #{Time.now + (60*30)}"
      # US phone numbers can make use of an image as well
      # media_url: image_url
    )
  end
end
