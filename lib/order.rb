require_relative 'dish'
require_relative 'menu'

class Order

    attr_accessor :order

    def initialize(*item_number)
        @order = []
        @item_numbers = [*item_number]
        @ticketcount = @item_numbers.count
        @ticket = []
        
        Menu.menu.each_with_index do |item, index|
            if index == @item_numbers[0..@ticketcount]
                @order.push(item)
            end
          end
    end
end