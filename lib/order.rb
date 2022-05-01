require_relative 'menu'
require 'rubygems'
require 'twilio-ruby'
require 'time'
require 'sinatra'

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

  attr_reader :order, :order_total

  def initialize

    @menu = Menu.new
    @order = []
    @order_total = 0

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)

  end

  def pick_item(item)

    return unless @menu.menu.has_key?(item)
    @order << item

  end

  def pick_multi_items(items)

    items.each do |item| 
      if @menu.menu.has_key?(item)
        @order << item
      end
    end

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

  private

  def send_order_text

    @client.messages.create(
      from: '+19805504523',
      to: ENV['PHONE_NUM'],
      body: "Thanks! Your order has been received and will be with you by #{arrival_time}"
    )

  end

end
