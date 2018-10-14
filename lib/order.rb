require_relative "menu.rb"
require_relative "sms.rb"

class Order
  include Sms
  attr_reader :list, :order

  def initialize(list = {}, order = [])
    @list = list
    @order = order
  end


  def choose(dish, qty)
    dish.capitalize!
     @list = {num: qty, name: dish}
     @order.push(@list)
  end

  def price
    prices = []
    sum = 0
    @order.each do |item|
      p item
      item.each_pair do |key, value|
        prices.push(value)
      end
    end

    p "help"
    prices.each {|x| sum += x}
    return sum
  end

def place
  Sms.send
end
end
