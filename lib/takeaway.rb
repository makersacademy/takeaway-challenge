require 'menu'
class Takeaway
    attr_reader :menu, :order

    def initialize ( menu = Menu.new)
        @order = {}
        @menu = menu
    end


    def dishes
        menu.each { |item, price|  "#{item}, price: #{price}£" }
    end

    def select (dish, quantity)
        @order.store(dish, quantity)
    end


    
end