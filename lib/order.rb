require_relative 'menu'
require 'rubygems'
require 'twilio-ruby'
require 'time'
# require 'sinatra'

# post '/message' do
#   number = params['From']
#   body = params['Body']

#   content_type 'text/xml'
#   "<Response>
#     <Message>
#       Hello #{number}. You said: #{body}
#     </Message>
#   </Response>"
# end

class Order

  attr_reader :order, :order_total, :simp_order

  def initialize

    @menu = Menu.new
    @order = []
    @order_total = 0
    @simp_order = ""

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)

  end

  def pick_item(item, quantity)

    fail "Please choose from the menu" unless @menu.menu.has_key?(item)
    quantity.times { @order << item }

  end
  
  def order_value

    count = 0
    @order.each do |order_item|
      if @menu.menu.has_key?(order_item)
        count += @menu.menu[order_item]
      end
    end
    @order_total + count

  end

  def arrival_time

    (Time.now + 1 * 60 * 60).strftime("%k:%M")

  end

  def place_order

    send_order_text
    "Thanks! Your order has been received and will be with you by #{arrival_time}"

  end

  def order_summary

    "Your order so far is: #{simplify_order}"

  end

  def simplify_order

    pep = @order.count("Pepperoni Pizza")
    marg = @order.count("Margherita Pizza")
    neap = @order.count("Neapolitan Pizza")
    fior = @order.count("Fiorentina Pizza")

    @simp_order << "#{pep}x Pepperoni Pizza " if @order.include?("Pepperoni Pizza")
    @simp_order << "#{marg}x Margherita Pizza " if @order.include?("Margherita Pizza")
    @simp_order << "#{neap}x Neapolitan Pizza " if @order.include?("Neapolitan Pizza")
    @simp_order << "#{fior}x Fiorentina Pizza " if @order.include?("Fiorentina Pizza")

    @simp_order << "| Totalling: £#{order_value}"
      
  end

  private

  def send_order_text

    @client.messages.create(
      from: '+19805504523',
      to: ENV['PHONE_NUM'],
      body: "Thanks for your order! #{@simp_order} will be with you by: #{arrival_time}"
    )

  end

end
