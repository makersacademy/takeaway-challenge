require_relative 'menu'
require 'twilio-ruby'
require("bundler")
Bundler.require()

class TakeAway

  attr_reader :menu

  attr_accessor :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @output = ''
  end

  def read_menu
    menu.dishes
  end

  def order(user_input, amount = 1)
    basket_checker(user_input)
    basket << { user_input => amount }
    puts "#{amount}x #{user_input}(s) added you your basket"
  end

  def basket_checker(user_input)
    raise "item not in menu" if !menu.dishes.has_key?user_input
  end

  def basket_summary
    foo = basket.to_a
    output = ''
    foo.each {|x| x.each { |y| output << y.to_s }}
    output = output.join
  end

  def send
    account_sid = 'xxxx'
    auth_token = 'xxxx'
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: '+441522246428',
      to: '+xxxx',
      body: output
)
  end
end
