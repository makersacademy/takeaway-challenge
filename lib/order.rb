require_relative 'menu'
require 'twilio-ruby'

class Order

  attr_reader :order, :total, :menu

  def initialize
    @menu = Menu.new
    # @menu.print_menu
    @order = []
  end

  def add_items(item)
    @order << @menu.menu[item - 1]
  end

  def check_order
    @total = 0
    @order.each do |item|
      item.each do |item, price|
        puts "#{item}: £#{price}"
        @total += price
      end
    end
    puts "Total: £#{@total}"
  end

  def submit_and_confirm
    raise "Your order is empty" if @order.empty?
    time = Time.new

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+16516152835'
    to = '+447413342817'

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before #{(time + 3600).strftime('%H:%M')}"
)   
  end
end 
