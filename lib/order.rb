require 'pry'
require 'twilio-ruby'

class Order

  attr_reader :menu, :current_order, :summary

  def initialize(menu)
    @menu = menu
    @current_order = []
    @summary = []
    
  end

  def see_menu
    menu.see_dishes
  end

  def place_order(name, quantity)
    @current_order << [name,  @menu.dish_price(name), quantity]
    subtotal
    @summary.last
  end

  def subtotal
    current_order.each do |order|
    @summary << [order[0], order[2], (order[1])*(order[2])]
    end
  end

  def summarize
    @summary.dup
  end

  def total
    total = 0
    @summary.each { |order| total += order[2]}
    summary + [[:total, total]]
  end


  def confirm_order(money)
    raise "Insufficient payment" if money != total.last[1]
    send_sms
  end

private

  def tw_setup
    account_sid = ENV['TWILIOID']
    auth_token = ENV['TWILIOTOK']
    @client = Twilio::REST::Client.new account_sid, auth_token 
  end

  def send_sms
    tw_setup
    @client.account.messages.create({
     :from => ENV['FROM'], 
     :to => ENV['TO'], 
     :body => '"Thank you! Your order was placed and will be delivered before #{((Time.new.hour)+1)}" + ":#{Time.new.min}"',  
     })
  end
end