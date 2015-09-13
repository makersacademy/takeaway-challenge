require 'twilio-ruby'

account_sid = "ACef87d7dfc16f3cebd55fc9ec9969335a"

class Menu

    attr_reader :menu, :order, :order_total

    def initialize
        @menu = { "hamburger" => 2, "pizza" => 5 }
        @order = []
        @order_total = []
    end

    def check_menu
        menu
    end

    def select_dishes(*selection, total)
        selection.each do |i|
            if menu.has_key?(i)
                puts "#{i}".capitalize + " has been added to your order"
                order << i
                order_total << menu[i]
            else
                puts "#{i}".capitalize + " is not on our menu"
            end
        end
            if order_total.inject(:+) == total
                puts "Thank you, you will receive a confirmation text shortly"
                send_text
            else
                fail "The total cost you entered was incorrect"
            end
    end

    def check_total
        return order_total.inject(:+)
    end

    def send_text
        account_sid = 'ACef87d7dfc16f3cebd55fc9ec9969335a'
        auth_token = '720f3dadd2aaa05bd816b43b5bd99059'
        @client = Twilio::REST::Client.new account_sid, auth_token
        message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered within the next hour",
            :to => "+447706910776",     
            :from => "+441270261008")   
    end
end