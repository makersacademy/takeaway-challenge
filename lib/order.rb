require_relative 'menu'

class Order
    
    attr_reader :choices
    
    def initialize
        @choices = []
    end
    
    def decision
        puts "Please choose an item from the menu"
        choice = gets.chomp
        menu = Menu.new.dish_list
        picks = menu.select { |dish, price| dish.to_s.match(/^choice\d+/) }
        @choices << picks
    end
    
    def total
        @choices.map { |h| h[:"b"] }.sum
    end
end
menu = Menu.new.dish_list
order = Order.new.decision
order.total