require_relative 'dishes'
require_relative 'order'
require 'envyable'
Envyable.load('./config/env.yml', 'development')
require 'twilio-ruby'

class Menu
  attr_reader :dishes_list, :new_order
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  @@client = Twilio::REST::Client.new(account_sid, auth_token)
  @@from = '+12396884386'

  def initialize(dishes_list = Dishes.new)
    @dishes_list = dishes_list
    @new_order = []
  end

  def print_available_dishes
    @dishes_list.dishes.each do |dish|
      puts "#{dish[:id]}.#{dish[:name]}: £#{dish[:price]}" if dish[:available] > 1
    end
  end

  def select_dish(dish_id, amount)
    @dishes_list.is_available?(dish_id, amount)
    amount.times do
      @dishes_list.dishes.each do |dish|
        if dish[:id] == dish_id
          @new_order << { dish[:name] => dish[:price] }
          dish[:available] = dish[:available] - 1
        end
      end
    end
  end

  def send_text(customer_number = '+447588526828')
    @@client.messages.create(
    from: @@from,
    to: customer_number,
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end
end
