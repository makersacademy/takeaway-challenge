require_relative 'diner'
require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Customer

  attr_reader :order_total, :diner

  def initialize
    @order_total = 0
  end

  def view_menu(diner=Diner.new)
    @diner = diner
    @diner.print_items
  end

  def order_items(quantity, dish)
    @diner.menu.each {
      |item, price| if dish.capitalize == item then @order_total += price*quantity end
    }
    @order_total = ('%.2f' % order_total).to_i
    puts "#{quantity} orders of #{dish}. That will be £#{@order_total}. If that sounds right, confirm using confirm_order!"
  end

  def confirm_order
    self.send_message
    puts "Great! You should receive a text confirmation shortly."
  end

  def send_message
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    @client.account.messages.create({
	     :from => ENV['RESTAURANT_NUMBER'],
	     :to => ENV['CUSTOMER_NUMBER'],
       :body => "Thanks for your order! Your food will be delivered before #{(Time.now + (60*60)).strftime("%H:%M")}"
    })
  end

end
