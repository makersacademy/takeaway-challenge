require_relative './dish.rb'
require 'rubygems'
require 'twilio-ruby'

# put your own credentials here
account_sid = ''
auth_token = ''

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

class Order
  attr_reader :dishes_ordered

  def initialize(*dishes)
    @dishes_ordered = dishes
    @order_total = total
  end

  def total
    total = []
    @dishes_ordered.each do |dish|
      total << dish.price
    end
    total.sum
  end

  def check_order
    print_order = "Your order: "
    @dishes_ordered.each do |dish|
      print_order << "#{dish.name} - £#{dish.price}, "
    end
    print_order << "Total: £#{@order_total}"
    print_order
  end
end
