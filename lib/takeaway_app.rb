require_relative './order.rb'
require_relative './order_item.rb'
require 'twilio-ruby'

class TakeawayApp

  attr_reader :order

  $menu = [{ :dish => "Chicken Korma", :price => 8 }, { :dish => "Lamb Balti", :price => 9 }]
  def show_dishes
    menu = [{ :dish => "Chicken Korma", :price => 8 }, { :dish => "Lamb Balti", :price => 9 }]
    menu.each_with_index { |menu_item, index| puts "#{index + 1}. #{menu_item[:dish]} £#{menu_item[:price]}" }
  end

  def prompt_order
    print "Please enter the dish number followed by a space followed by the quantity you would like to order."
    puts " When you are finished please press enter twice."
  end

  def receive_order(order)
    @order = order
    # use this @order for non testing
    # @order = Order.new
  end

  def show_order
    @order.show
  end

  def check_calculation
    check_cost = 0
    @order.contents.each { |a| check_cost += a.cost }
    raise "Does not add up correctly" if @order.total != check_cost
  end

  def time_in_an_hour
    t = Time.new + 3600
    t.strftime("%H:%M")
  end

  def create_message
    "Thank you! Your order was placed and will be delivered before #{time_in_an_hour}"
  end

  def send_message
    account_sid = 'AC297b79f096953ffb25e6c7a7554798b9'
    auth_token = 'c3fce4179277f9e78c5c5897cb1448aa'
    client_phone_no = '+447815793407'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.api.account.messages.create({
      :from => '+441158246050',
      :to => client_phone_no,
      :body => create_message,
    })
  end

end

# running the app below
# t = TakeawayApp.new
# t.show_dishes
# t.prompt_order
# t.receive_order
# t.show_order
# t.check_calculation
# t.create_message
# t.send_message
