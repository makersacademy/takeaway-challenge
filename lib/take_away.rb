require 'customer.rb'
require 'menu.rb'
require 'txt_message'
require 'rubygems'
require 'twilio-ruby'

class TakeAway
  attr_reader :take_away_name, :take_away_menu
  attr_accessor :order, :total, :client, :order_time

  def initialize(name, message)
    @take_away_name = name
    @txt_message = message
    @take_away_menu = Menu.new.menu
    @order = {}
  end

  def display_menu
    @take_away_menu.each { |key, val| puts "#{key}....£#{val}".center(160) }
  end

  def take_order(dish, quantity)
    sub_total = @take_away_menu[dish.to_sym] * quantity
    @order[dish.to_sym] = sub_total
  end

  def calculate_total
    @total = 0
    @order.each_value { |val| @total += val }
  end

  def add_total
    @order[:total] = @total
  end

  def return_order
    calculate_total
    validate_total
    add_total
    @order.each { |key, val| puts "#{key}....£#{val}".center(160) }
  end

  def correct?
    sum = 0
    @order.each_value { |val| sum += val }
    sum == @total
  end

  def validate_total
    fail "Error: Sum did not match the total" unless correct?
  end

  def time_of_order
    @order_time = Time.now
  end

  def delivery_time
    @delivery_time = time_of_order + 3600
  end

  def confirm_order
    message = "Thank you!, your order was placed and will be delivered before #{delivery_time.hour}:#{delivery_time.min}"
    @txt_message.send_message(message)
  end

end
