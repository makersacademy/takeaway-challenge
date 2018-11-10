# require './customer.rb'
# require './menu.rb'
require 'customer.rb'
require 'menu.rb'

class TakeAway
  attr_reader :take_away_name, :take_away_menu
  attr_accessor :order, :order_time, :delivery_time, :total

  def initialize(name)
    @take_away_name = name
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

  def return_order
    @total = 0
    @order.each { |key, val| @total += val }
    fail "Error: Sum did not match the total" unless correct?
    @order[:total] = @total
    @order.each { |key, val| puts "#{key}....£#{val}".center(160) }
  end

  def correct?
    sum = 0
    @order.each { |key, val| sum += val }
    true unless sum != @total
  end

  def time_of_order
    @order_time = Time.now
  end

  def delivery_time
    @delivery_time = time_of_order + 3600
  end

  def confirm_order
    "Thank you!, your order was placed and will be delivered before #{delivery_time}"
  end

end
