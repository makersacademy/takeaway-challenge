# require './customer.rb'
# require './menu.rb'
require 'customer.rb'
require 'menu.rb'

class TakeAway
  attr_reader :take_away_name, :take_away_menu
  attr_accessor :order

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
    total = 0
    @order.each { |key, val| total += val }
    @order[:total] = total
    @order.each { |key, val| puts "#{key}....£#{val}".center(160) }
  end


end
