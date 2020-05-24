require_relative 'takeaway'
require_relative 'menu'

class Order

    attr_reader :items, :menu

    def initialize
      @items = Hash.new(0)
      @menu = Menu.new
    end

    def to_order(dish, quantity = 1) 
       @items[dish] += quantity
    end

    def order_total
    meal = @menu.display_menu
    @items.each { |key, value| return (5 * value) }
  end


    
end



