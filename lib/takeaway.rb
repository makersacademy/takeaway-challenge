require 'dotenv/load'
require_relative 'menu'
require 'twilio-ruby'
class Takeaway 
  attr_reader :menu, :basket, :total 
  def initialize(menu = Menu)
    @menu = menu.new # pass in menu class here. menu.new will boot up any obj. 
    @basket = []
  end
  
  def display_menu 
    @menu.display  
  end 

  def add(num = 1, dish)
    if menu.items.has_key?(dish)
      num.times { @basket << { dish => menu.items[dish] } }
      "added to basket!"
    else "This dish is not on the menu"
    end 
  end 

  def bill
    total = 0 
    @basket.each { |x| x.each { |_, price| total += price } }  
    total
  end

  def order 
    arrival_time = Time.new + (60 * 60)
    "Order is on it's way! ETA: #{arrival_time.strftime("%H:%M")}"
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    
    @client.messages.create(
      from: ENV['TWILIO_NUM'], 
      to: ENV['MY_NUM'],
      body: "Order is on it's way, your data is safe! ETA: #{arrival_time.strftime("%H:%M")}")
  end 

end
