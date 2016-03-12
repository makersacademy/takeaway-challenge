require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Order

  MENU = [
          {name: 'sushi', price: 7},
          {name: 'ramen', price: 12},
          {name: 'soup', price: 4.5},
          {name: 'fish and chips', price: 10},
          {name: 'bread', price: 3},
          {name: 'olives', price: 1.5}
          ].freeze

  def show_menu
    menu = ''
    MENU.each {|item| menu << "#{item[:name]}: £#{item[:price]}\n"}
    menu
  end

  def price(dish)
    raise 'Choose dishes in the menu' unless in_menu?(dish)
    MENU.each {|item| return item[:price] if item[:name] == dish[:name]}
  end

  def confirm
    @client = Twilio::REST::Client.new ENV['SID'], ENV['TOKEN']
    @client.messages.create(
      from: ENV['FROM'], to: ENV['MY_NUMBER'],
      body: "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
    )
  end

  private

  def in_menu?(dish)
    MENU.any? {|item| item[:name] == dish[:name]}
  end
end
