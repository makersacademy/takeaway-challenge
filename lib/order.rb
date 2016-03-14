require_relative 'menu'
require 'pry'
class Order

  attr_reader :selections

  def initialize(menu_class = Menu)
    @selections = []
    @menu_class = menu_class
    @menu = menu_class.new
  end

  def choose(item, quantity)
    quantity.times { @selections << [item, @menu.pick(item)] }
  end

  def sum_total
    @sum = 0
    @selections.each { |item| @sum += item[1] }
    @sum
  end

  def complete_order(pay)
    if pay == @sum
      send_sms
      "Thanks for your order"
    else
      raise("Payment error!")
    end
  end

  def send_sms
    # twilio_text
  end

  private

  def twilio_text
    require 'rubygems'
    require 'twilio-ruby'

    account_sid = ENV['TWILSID']
    auth_token = ENV['TWILTOK']

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
    	:from => ENV['FROM'],
    	:to => ENV['TO'],
    	:body => 'Thanks for your order, get ready for mail order steak!',
    })
  end

end
