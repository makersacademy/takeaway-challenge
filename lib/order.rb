require_relative "menu"

class Order


attr_reader :menu
attr_accessor :basket

def initialize(menu = Menu.new)
  @basket = []
  @menu = menu


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





end
