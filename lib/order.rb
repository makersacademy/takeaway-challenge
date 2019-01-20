require 'meatdish'
require 'menu'

class Order
    attr_reader :menu
    attr_accessor :balance

    def initialize
      @menu = {
        'shrimp' => 3.30,
        'chicken' => 4.30,
        'egg' => 2.10
      }
      @basket = {}
      @balance = 0
    end


    def view_menu
        @menu
    end

    def add_food (dish, quantity = 1)
        @basket[dish] = quantity
    end

    def calculate_balance
        @basket.each do |dish, quantity|
            add_balance(@menu[dish].to_f * quantity.to_f)
        end
    end

    def add_balance(sum)
        @balance += sum
    end

    def check_out(total)
        raise "Incorrect amount" if total != @balance

    end

end
