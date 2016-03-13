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
    # binding.pry
  end

  def sum_total
    @sum = 0
    #binding.pry
    @selections.each { |item| @sum += item[1] }
    @sum
  end

  def complete_order(pay)
    if pay == @sum
      "Thanks for your order"
      send_sms
    else
      raise("Payment error!")
    end
  end

  private

  def send_sms
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
