require_relative('./order.rb')
class Takeaway
  attr_reader :menu, :total, :order

    def initialize(menu:)
      @total = 0
      @order = order
      @menu = menu
    end 

    def print_menu
      @menu.print
    end

    # def add_to_order(dish)
    #    @order.basket << @menu.assoc(dish)
    # end 

    # def show_total
    #   @order.basket.each do |item, price| 
    #   @total += price
    #   end 
    #   puts total
    # end
end 