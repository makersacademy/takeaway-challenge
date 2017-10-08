
require 'rubygems'
require 'twilio-ruby'
class Takeaway

  attr_reader :menu, :current_order

  def initialize
    @menu = Dishes.new
    @current_order = {}
  end

  def print_menu
    @menu.list
  end

  def select(dish, quantity = 1)
    @current_order[dish] = @menu.list[dish] * quantity
  end

  def order_total
    @current_order.values.sum
  end

  def place_order
    order_summary
  end

  def order_summary
    "Thanks! Your order, total of £#{order_total}, is being processed and will be delivered by #{delivery_time}!"
  end

  def delivery_time
    "#{(Time.now + 1*60*60).hour}:#{Time.now.min}"
  end

  # def send_message
  #
  #   account_sid = "AC6b680c51845c2d7a21665e16ac1d4ebe"
  #   auth_token = "62e1ac8639b024c2d19c880a9cc59b6b"
  #
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  #   message = @client.messages.create(
  #       body: "#{order_summary}",
  #       to: "+447596833699",
  #       from: "+441412806845")
  #
  #   puts message.sid
  #
  # end

  def text_confirmation
    # put your own credentials here
    account_sid = 'AC6b680c51845c2d7a21665e16ac1d4ebe'
    auth_token = '62e1ac8639b024c2d19c880a9cc59b6b'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    # # and then you can create a new client without parameters
    # @client = Twilio::REST::Client.new

      message = @client.api.account.messages.create(
                from: "+441412806845",
                to: "+447596833699",
                body: "#{order_summary}")
  end
end
