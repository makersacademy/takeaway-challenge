require './lib/menu.rb'
require 'sinatra'
require 'twilio-ruby'

class Takeaway
  attr_reader :menu

  def initialize

  end

  def menu
    menu = Menu.new
    menu.dishes
  end

  def final_order
    menu.order
  end

  def send_text_confirmation
    # post '/send_sms' do
    # to = params["to"]
    # message = params["body"]
    #
    # client = Twilio::REST::Client.new(
    # ENV['AC286a71d2ff9891d18da00a17e8bbb29b'],
    # ENV['4f896328a27647da204bc9f3258c6c2f']
    # )
    #
    # client.messages.create(
    # from: ENV['+441133206359'],
    # to: ENV['+447482604970'],
    # body: "you just ordered a takeaway! Enjoy!"
    # )
  end

  def confirm_order_with_order_sum
  end

end
