class Menu
    attr_reader :dishes
    def initialize 
        # all menu items
        @dishes = { "Pizza" => 3, "Burger" => 4, "Fries" => 2, "Vodka" => 3.50, "Wine" => 34 }
    end 
end

require_relative 'order'

order = Order.new 
order.view