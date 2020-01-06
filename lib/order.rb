require_relative 'menu'
class Order
    
    attr_accessor :order
    def initialize(menu= Menu.new(items))
      @order = {} 
      @menu = menu
      @total = 0
    end

    def add(item, quantity)
      fail "Error item not available" if !@menu.item_included?(item)
      @order[item] = quantity
    end

    def total
      total = @order.map do |item, quantity|
        @menu.price(item) * quantity
      end
      total.inject(:+)
    end
end

