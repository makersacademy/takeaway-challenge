require_relative 'menu'

class Order
    attr_reader :menu
    attr_accessor :balance

    def initialize
      @menu = Menu.new
      @basket = {}
      @balance = 0
    end

    def add_food (dish, quantity = 1)
        #raise "Item not on menu" if @menu.includes_item?(dish) == false
        @basket[dish] = quantity
    end

    def calculate_balance
        @basket.each do |dish, quantity|
            add_balance(@menu.menu_list[dish] * quantity)
        end
    end

    def add_balance(sum)
        @balance += sum
    end

    def check_out(total)
        raise "Incorrect amount" if total != @balance
        ##raise "Basket empty" if @basket.length < 1
    end

end
