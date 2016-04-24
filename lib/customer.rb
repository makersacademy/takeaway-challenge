require_relative 'menu'
require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Customer

  #attr_reader :total

  def initialize
    @diner = Diner.new
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    @order_total = 0
  end

  def view_menu
    @diner.print_items
  end

  def order_items(quantity, dish)
    @diner.menu.each {
      |item, price| if dish.capitalize == item then @order_total += price*quantity end
      }
    @order_total = ('%.2f' % order_total).to_i
    puts "What is the total of your order?"
    gets.to_i == total ? self.confirm_order : "Incorrect total! Try again."
  end

  def confirm_order
    @client.account.messages.create({
	     :from => ENV['RESTAURANT_NUMBER'],
	     :to => ENV['CUSTOMER_NUMBER'],
       :body => "Your order will be delivered before #{(Time.now + (60*60)).strftime("%H:%M")}"
    })
  end

end
