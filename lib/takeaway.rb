require_relative 'menu'
require 'dotenv'
require 'twilio-ruby'

class Takeaway

  attr_reader :total, :credentials

  def initialize(menu_klass = Menu)
    @menu = menu_klass.new
    @basket = Hash.new(0)
    @total = 0
    @credentials = Dotenv.load
  end

  def menu
    @menu.dishes.dup
  end

  def order(dish, quantity=1)
    fail 'Sorry, that item is not on the menu' if menu.has_key?(dish) == false
    @basket[dish] += quantity
    @total += menu[dish] * quantity
  end

  def confirm_order(estimate)
    fail 'Total is not correct, please try again' if estimate != total
    send_text
    "Thanks for your order, it will be delivered by #{Time.new.hour+1}:#{Time.new.min}"
  end

  def basket
    @basket["Total"] = "£#{total}"
    @basket
  end

  private

  attr_reader :time

  def send_text
    # put your own credentials here
    account_sid = @credentials["ACCOUNT_SID"]
    auth_token = @credentials["AUTH_TOKEN"]

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
    	:from => '+441772367478',
    	:to => '+447527030112',
      :body => "Thanks for your order! Your total is £#{total}, your food will be delivered by #{time.strftime("%H:%M")}"
    })
  end

  def time
    @time = Time.new + 3600
  end

end
