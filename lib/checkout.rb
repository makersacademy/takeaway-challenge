require 'rubygems'
require 'twilio-ruby'
require_relative 'order'
require_relative 'till'

class Checkout

  include Till

  attr_reader :order

  def initialize order
    @order = order
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def final_total
    total @order.dishes
  end

  def display_final_order
    display_order @order.dishes
  end

  def no_dishes_ordered?
    @order.dishes.empty?
  end

  def send_msg
    if no_dishes_ordered?
      fail 'No dishes have been added to the order'
    else
      @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{(Time.now + (60 * 60)).asctime} and will cost £#{final_total}",
        :to => "+447814227163",
        :from => "+441332402819")
    end
  end

end