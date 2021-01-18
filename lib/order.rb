require 'twilio-ruby'

class Order

    attr_reader :menu, :items

    def initialize(menu)
        @menu = menu
        @items = []
        @items_detail
        @total = 0
    end

    def add(dish)
        @items << dish
        @items[-1]
    end

    def open
        menu.list
        select
        if confirm
            send_confirmation
        end
    end

    def select
        puts "Enter number of dish to add to order. Enter empty to complete."
        while true do
            item = STDIN.gets.chomp
            break if item.empty?
            items << item.to_i
        end
    end

    def confirm
        print
        puts "Enter 'YES' to confirm order, leave blank to cancel order"
        STDIN.gets.chomp.upcase == 'YES'
    end

    def print
        summarise_order
        puts "Your order summary is as follows:"
        puts "---------------------------------"
        @items_detail.each do |key, item|
            puts "#{item[:qty]} x #{item[:name]}(#{key}) @ #{item[:price]} = £#{item[:subtotal]}"
        end
        puts "---------------------------------"
        puts "Total cost of order = £#{@total}"
    end

    def summarise_order
        items_counter = Hash.new(0)
        items.each { |item| items_counter[item] += 1 }
        @items_detail = {}
        @total = 0
        items_counter.each do |key, qty|
            dish_detail = lookup_dish_on_menu(key, qty)
            @items_detail[key] = dish_detail
            @total += dish_detail[:subtotal]
        end
        @total = @total.round(2)
    end

    def lookup_dish_on_menu(key, qty)
        dish_detail = {}
        menu.dishes.each do |dish_obj|
            if dish_obj.id == key
                dish_detail = {name: dish_obj.name, price: dish_obj.price, qty: qty, subtotal: (dish_obj.price * qty)}
            end 
        end
        dish_detail
    end

    def send_confirmation
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']
        message_body = "Thank you! Your order was placed and will be delivered before #{(Time.now + 3600).strftime("%k:%M")}"
        @client = Twilio::REST::Client.new(account_sid, auth_token)
         
        message = @client.messages.create( 
                                     body: message_body, 
                                     from: '+12142734771',       
                                     to: '+447985254497' 
                                   ) 
         
        puts message.sid
    end
end