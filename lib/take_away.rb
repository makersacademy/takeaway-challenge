require 'customer.rb'
require 'menu.rb'
require 'txt_message'
require 'time_methods'
require 'rubygems'
require 'twilio-ruby'

class TakeAway
  include TimeMethods
  attr_reader :take_away_name, :take_away_menu
  attr_accessor :order, :total, :client

  def initialize(name)
    @take_away_name = name
    @take_away_menu = Menu.new
    @order = {}
  end

# Planning to move the order methods will be moved to an Orders class
  def take_order(dish, quantity)
    sub_total = @take_away_menu.menu[dish.to_sym] * quantity
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

  def confirm_order
    message = "Thank you!, your order was placed and will be delivered before #{delivery_time.hour}:#{delivery_time.min}"
    MessagingService.new.send_message(message)
  end

end
