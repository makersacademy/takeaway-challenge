require_relative 'menu'
require 'twilio-ruby'


class Takeaway
    
    attr_accessor :dishes, :orders, :delivery_time, :text

    def initialize(menu = Menu.new)
        @dishes = menu
        @orders = []
    end

    def print_dishes
        @dishes.display
    end

    def select(dish)
        @orders << @dishes.dishes[dish - 1]
    end

    def total
        cost = 0 
        @orders.each do |dish|
            cost += dish[:price]  
        end
        cost
    end

    def calc_delivery_time
        Time.now + 60 * 60
    end

    def send_text
        account_sid = "asdfgasrerefdav4264655ywgs56uw5y" # TODO Replace this with your own Account SID.
        auth_token = "wyegse56e3345yeg56eue6u65ey3456" # TODO Replace this with your own Auth Token.

        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = "+55555555555"  # TODO Use the trial number provided by Twilio.
        to = "+4455555555555"    # TODO Use a verified number to send tests to.
        client.messages.create(
            from: from,
            to: to,
            body: "Thank you! Your order was placed and will be delivered before #{calc_delivery_time.strftime('%H:%M')}. You have ordered #{orders.length} items, the total is £ #{total}."
        )
        @orders = []
    end
end