require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Order

  attr_reader :view, :total

  def initialize
    @view = []
    @total = 0
  end

  def add(dish, quantity)
    @view << dish
    dish.quantity(quantity)
    @total += dish.price * dish.quantity
  end

  def finish
    send_sms
  end

  private

  def tw_setup
    account_sid = ENV['TWILIOID']
    auth_token = ENV['TWILIOTOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms
    tw_setup
    @client.account.messages.create({
     :from => ENV['FROM'],
     :to => ENV['TO'],
     :body => "Thank you! Your order was placed and will be delivered before #{((Time.new.hour)+1)}" + ":#{Time.new.min}",
     })
  end

end
