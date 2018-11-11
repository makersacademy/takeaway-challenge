require 'customer.rb'
require 'menu.rb'
require 'txt_message'
require 'rubygems'
require 'twilio-ruby'

class TakeAway
  attr_reader :take_away_name, :take_away_menu
  attr_accessor :order, :total, :client

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

  def return_order
    @total = 0
    @order.each { |key, val| @total += val }
    validate_total
    @order[:total] = @total
    @order.each { |key, val| puts "#{key}....£#{val}".center(160) }
  end

  def correct?
    sum = 0
    @order.each { |key, val| sum += val }
    true unless sum != @total
  end

  def validate_total
    fail "Error: Sum did not match the total" unless correct?
  end

  def confirm_order
    @txt_message.send_message
  end

end
