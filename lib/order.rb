require_relative 'menu.rb'
require_relative 'sms.rb'
require 'dotenv'
Dotenv.load

class Order

    attr_accessor :selection, :menu_class

    def initialize(menu_Klass)
        @menu_class = menu_Klass
        @current_order_total = nil
    end

    def view_menu
        @selection = @menu_class.new
    end

    def order_food(dish, quantity)
        selection.make_selection(dish, quantity)
    end

    def display_order
        selection.users_order
    end

    def calculate_price
        @current_order_total = selection.users_order.map {|choice| choice[:price] * choice[:quantity] }.inject(0, :+)
        return "The total cost is £#{current_order_total}"
    end

    def send_sms(message)
        fail "Cannot send sms: Amount has not yet been calculated" unless price_calculated?
        sms = Sms.new if price_calculated?
        sms.send_message(message)
    end

    private

    attr_accessor :current_order_total

    def price_calculated?
        @current_order_total = current_order_total
    end
end
