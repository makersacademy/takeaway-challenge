require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Takeaway

  attr_reader :current_order, :order

  def initialize(twilio, menu = Menu.new)
    # ### Begin Twilio-API Setup
    # account_sid = ENV['ACCOUNT_SID']
    # auth_token = ENV['AUTH_TOKEN']
    # @client = Twilio::REST::Client.new account_sid, auth_token
    ### End Twilio-API Setup
    @twilio = twilio
    @dishes = menu.dishes
    @menu = menu
    @order = Order.new(@menu)
    @output = Output.new(@order, @dishes)
  end

  def show_menu
    @output.show_menu
  end

  def show_total
    @output.show_total
  end

  def show_basket
    @output.show_basket
  end

  def add(dish, quantity = 1)
    @order.add_to_order(dish, quantity)
  end

  def checkout(sum)
    @order.complete_order(sum)
    send_text_confirmation
  end

  private

  def send_text_confirmation
    @message = @twilio.messages.create(
      to: ENV['TO'],
      from: ENV['FROM'],
      body: "Thank you! Your order was placed and will be delivered before #{ Time.new.hour+1 }:#{ add_zero(Time.new.min.to_s) }."
    )
  end

  def add_zero(num)
    num.to_i > 9 ? num : "0#{ num }"
  end

end
