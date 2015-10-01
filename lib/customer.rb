require_relative 'menu'
require 'rubygems'
require 'twilio-ruby'
require_relative '../.env.rb'

class Customer
  include Twilio

  attr_accessor :menu, :order, :order_total, :total_items

  def initialize
    @menu = Menu.new
    @order = {}
    @order_total = 0
    @total_items = 0
  end

  def receipt
    order.map do |dish, quantity|
      "#{quantity}x #{dish} - £#{menu.menu_list[dish] * quantity}"
    end.join(', ')
  end

  def display_menu
    menu.menu_list.each { |key, value| puts "#{key} - £#{value}" }
  end

  def select_dish(dish, quantity)
    fail 'Dish not on menu' unless menu.menu_list.key?(dish)
    update_total_items(quantity)
    add_to_order(dish, quantity)
    update_price(dish, quantity)
  end

  def order_total_cost
    'Total    £' + order_total.to_s
  end

  def send_message(number_to_send_to)
    twilio_sid = ENV[:account_sid]
    twilio_token = ENV[:auth_token]
    twilio_phone_number = ENV[:phone_num]

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.messages.create(
      body:
        "Thank you! Your order was placed and will" +
          " be delivered within the next hour.",
      to: number_to_send_to,
      from: '+442820032756')
  end

  private

  def update_price(dish, quantity)
    @order_total += menu.menu_list[dish] * quantity
  end

  def update_total_items(quantity)
    @total_items += quantity
  end

  def add_to_order(dish, quantity)
    @order[dish] = quantity
  end
end
