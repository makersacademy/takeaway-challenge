require_relative 'menu'
require 'rubygems'
require 'twilio-ruby'

class TakeAway
  def initialize(menu = Menu)
    @menu = menu.new.list
    @order = []
  end

  attr_reader :menu

  def order(dish)
    menu.each { |item| return @order << item if item[:dish] == dish }
  end

  def total_quantity
    @order.length
  end

  def total_amount
    total_amount = 0
    @order.each { |item| total_amount += item[:price] }
    total_amount.round(2)
  end

  def confirmation
    total_amount
    total_quantity == 1 ? item = "item" : item = "items"
    "You have #{total_quantity} #{item} in your basket for a total of £#{total_amount}."
  end

  def confirmation_text
    # account_sid = 'x'
    # auth_token = 'x'
    # @client = Twilio::REST::Client.new(account_sid, auth_token)
    # message = @client.messages.create(
    # body: "Thank you! Your order has been confirmed. 
    #  It will be with you before #{Time.now + 1*60*60}.",
    # messaging_service_sid: 'x',
    # to: '+')
    # puts message.sid
  end
end
