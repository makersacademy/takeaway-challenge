require_relative 'menu.rb'
require_relative 'sms.rb'

class Order

    attr_accessor :orders, :menu_class

    def initialize(menu_Klass)
        @menu_class = menu_Klass
        @current_order = nil
    end

    def see_menu
        @orders = @menu_class.new
    end

    def order_food(order_number, quantity)
        orders.make_selection(order_number, quantity)
    end

    def display_bill
        orders.users_order
    end

    def calculate_price
        @current_order = orders.users_order.map {|choice| choice[:price]}.inject(0, :+)
        return "The total cost is £#{current_order}"
    end

    def send_sms(message)
        fail "Cannot send sms: Amount has not yet been calculated" unless price_calculated?
        sms = Sms.new if price_calculated?
        sms.send_message(message)
    end

    private

    attr_accessor :current_order

    def price_calculated?
        @current_order = current_order
    end

end
