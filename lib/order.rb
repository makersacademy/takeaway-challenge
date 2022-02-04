require './lib/menu.rb'

class Order

    attr_reader :order_menu, :selection, :total

    def initialize(menu)
        @order_menu = menu
        @selection = []
        @total = 0
    end

    def add_selection(selection)
        @selection << selection
        puts "You have ordered: #{selection.name} - £#{selection.price}"
        @total += selection.price
        puts "Your total so far: £#{total}"
    end

    def checkout
        puts "Order"
        selection.each do |item|
            puts "#{item.name} - £#{item.price}"
        end
        puts "--------------"
        puts "Total: £#{@total}"
    end
end