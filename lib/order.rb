require_relative "menu"
require_relative "msg"

class Order


attr_reader :menu
attr_accessor :basket

def initialize(menu = Menu.new, msg = Msg.new)
  @basket = Hash.new(0)
  @menu = menu
  @Msg = msg
end

def add(dish, quantity = 1)
  raise "This dish is not on the menu" unless @menu.menu.has_key?(dish)
  @basket[dish] += quantity
end

def delete(dish, quantity = 1)
    @basket[dish] -= quantity
end

def total
    total = 0
    @basket.each { |dish, quantity| total += @menu.menu[dish] * quantity }
    total
end

def place_order
  puts "Thank you for your order. Total to pay: £#{total}"
  puts "You will shortly receive a msg to confirm your delivery time"
  @Msg.text
end


end
