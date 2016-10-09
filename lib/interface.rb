require 'rubygems'
require 'twilio-ruby'
class Interface
  attr_reader :order, :order_total

  def initialize
    @menu = Menu.new
    @order = {}
    @order_total = 0
  end

  def show_menu
    @menu.menu_list
  end

  def show_order
    @order
  end

  def add_to_order(food)
    @order[food] = @menu.menu_list[food]
  end

  def calculate_order
    @order.each {|k,v| @order_total += v}
    "So far you have ordered #{@order}. The total cost of this order is #{@order_total}"
  end

  def send_the_message

    account_sid = 'ACe2347e671c53b11ab3b5a7e785726247'
    auth_token = 'b4378a3a01be3bc74e39930709a720b3'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+441143032463',
      :to => '+447542672130',
      :body => 'Your meal is on its way and will arrive in one hour'
      })
  end


end
