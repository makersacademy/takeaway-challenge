require 'twilio-ruby'
require_relative 'menu'

class Takeaway

    attr_accessor :dishes, :orders, :delivery_time

    def initialize(menu = Menu.new)
        @dishes = menu
        @orders = []
        @account_sid = 'Your ID here'
        @auth_token = 'Your token here'
        @client = Twilio::REST::Client.new(@account_sid, @auth_token)
        @from = 'Twilio number here' 
        @to = 'Your number here'
    end

    def print_dishes
        @dishes.display
    end

    def selection(dish)
        @orders << @dishes.dishes[dish - 1]
    end

    def total
        cost = 0 
        @orders.each do |dish|
            cost += dish[:price]  
        end
        cost
    end

    def receipt
        @client.messages.create(
            from: @from,
            to: @to,
            body: "Thank you! Your order was placed and will be delivered before #{calc_delivery_time.strftime('%H:%M')}. You have ordered #{orders.length} items, the total is £ #{total}."
        )
        @orders = []
    end

    def calc_delivery_time
        Time.now + 60 * 60
    end
end