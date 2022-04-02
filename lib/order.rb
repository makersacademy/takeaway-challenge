require_relative 'dish'
require_relative 'menu'
require_relative 'TwilioTextMessenger'

class Order

    attr_accessor :order

    def initialize(menu, *item_number)
        @order = []
        @item_numbers = [*item_number]
        @menu = menu
        @total_price = 0
    end

    def submit_order
        @order = @item_numbers.map { |dish| @menu.menu[dish-1]}
        send_sms
    end

    def bill
        prepare_bill
    end

    private 
    def calculate_order_price
        @amounts = @order.map {|dish| dish.instance_variable_get(:@price)}
        @amounts.each { |amount| @total_price+=amount}
        "Total to pay: £#{@total_price}"
    end

    def prepare_bill
        @order.each { |dish| puts "#{dish.name}: £#{dish.price}"}
    end

    def send_sms
        TwilioTextMessenger.new
    end
end