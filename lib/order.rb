require_relative "menu"
require_relative "msg"

class Order


attr_reader :menu
attr_accessor :basket

def initialize(menu = Menu.new, msg = Msg.new)
  @basket = []
  @menu = menu
  @Msg = msg
end

def add(dish, quantity = 1)
  raise "This dish is not on the menu" unless @menu.menu.has_key?(dish)
  @basket << { :dish => dish, :quantity => quantity }
end

def delete(dish, quantity = 1)
    @basket.delete({ :dish => dish, :quantity => quantity })
end

def total
    total = 0
    @basket.each { |dish| total += @menu.menu[dish[:dish]] * dish[:quantity] }
    total
end

def place_order
  puts "Thank you for your order. Total to pay: £#{total}"
  puts "You will shortly receive a msg to confirm your delivery time"
  @Msg.text
end


end
