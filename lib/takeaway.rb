require 'twilio-ruby'
require 'time'


# put your own credentials here
@account_sid = ENV["TWILIO_KEY"]
@auth_token = ENV["TWILIO_AUTH"]
# Twilio number  +441942316301

# set up a client to talk to the Twilio REST API

class Takeaway



  attr_accessor :order, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    # @menu.print
    @order = []
    @order_finished = false
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def take_order
    while true do
      get_menu_item
      break if @order_finished == true
      get_quantity
    end
  end

  def print_receipt
    @total = 0
    @order.each do |line|
      line_total = line[:count] * line[:cost]
      puts "#{line[:desc]} @ £#{line[:cost]}0 x #{line[:count]}   : £#{line_total}0"
      @total += line_total
    end
    puts "-----------------------------------"
    puts "Total             : £#{@total}0"
  end

  def send_text
    now = Time.now
    p @client
    @client.messages.create(
      to: ENV["MY_NUM"],
      from: "+441942316301",
      body: "Your order has been placed and will be delivered before #{now.hour}:#{now.min}. The total cost is £#{@total}0"
    )
  end

  private

  def get_menu_item
    puts
    puts "What would you like to order?"
    puts "Please enter a menu line number (e.g. 1 for chips) or push enter to place your order."
    @item_index = gets.chomp.to_i - 1
    @order_finished = true if @item_index == -1
  end

  def get_quantity
    @item = @menu.menu_list[@item_index]
    puts "OK that's #{@item[:desc]}. How many of those would you like?"
    @item[:count] = gets.chomp.to_i
    @order << @item
  end
end
