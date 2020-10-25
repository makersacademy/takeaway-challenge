require 'colorize'
require 'twilio-ruby'

class Dish
    attr_reader :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
end

class Menu
    attr_reader :dishes

    # Sets courses list 
    def initialize
        @course_converter = {:starter => 0, :main => 1, :dessert => 2}
        @dishes = [[],[],[]]
        @courses = ["Starters:", "Mains:", "Desserts:"]
    end

    # Prints menu by courses
    def display_menu(course)
        puts @courses[course]
        @dishes[course].each_with_index do |dish, index|
            puts "   #{index+1}. #{dish.name} --- £#{dish.price}"
        end
        nil
    end

    # Adds a dish to the menu
    def add_dish
        puts "Enter name of dish:"
        name = gets.chomp
        puts "Enter price of dish (x.yz):"
        price = gets.chomp
        puts "Enter course:"
        course = @course_converter[gets.chomp.to_sym]
        @dishes[course] << Dish.new(name, price)
        puts "You have added a dish!".green
    end

    # Takes user input for choosing a dish to add to their basket
    def select_dish(course)
        puts "Enter the dish you want to add to your basket:"
        input = gets.chomp.to_i
        return @dishes[course][input-1]
    end

    # 
    def menu_options
        basket = []
        while true
            system "clear"
            puts "1. Starters"
            puts "2. Mains"
            puts "3. Desserts"
            puts "4. Checkout"
            input = gets.chomp.to_i
            if input == 4
                checkout(basket)
                break 
            else
                display_menu(input - 1)
                basket << select_dish(input - 1)
            end
        end
    end

    def checkout(basket)
        total = 0
        basket.each do |dish|
            total += dish.price.to_f
        end
        print_receipt(basket, total)
        if check_order?
            puts "Thank you for your order! You will soon receive a SMS confirmation".green
            send_text_confirmation
            return total
        else
            puts "Your order has been cancelled.".red
            return nil
        end
    end

    def shopping_menu
        while true
            system "clear"
            puts "1. View menu"
            puts "2. Quit"
            input = gets.chomp
            case input
            when "1"
                menu_options
            when "2"
                break
            end
        end
        system "clear"
        puts "See you later!".green
        nil
    end

    def send_text_confirmation
        account_sid = ENV["TWILIO_SID"]
        auth_token = ENV["AUTH_TOKEN"]

        @client = Twilio::REST::Client.new account_sid, auth_token
        message = @client.messages.create(
            body: "Thank you for making your order, it's on its way!",
            to: ENV["PHONE_NO"],
            from: "+14328887495")

        if message.sid
            true
        else
            false
        end
    end

    def load_dishes
        file = File.open("dishes.csv", "a+")
        file.readlines.each do |line|
            name, price, course = line.chomp.split(",")
            @dishes[course.to_i] << Dish.new(name, price)
        end
        file.close
    end

    def save_dishes
        file = File.open("dishes.csv", "w+")
        @dishes.each_with_index do |course, index|
            course.each do |dish|
                dish_data = [dish.name, dish.price, index].join(",")
                file.puts dish_data
            end
        end
        file.close
    end

    private
    def print_receipt(basket, total)
        printed_dishes = []
        system "clear"
        puts "Order:"
        basket.each do |dish|
            if !printed_dishes.include?(dish)
                amount = basket.count(dish)
                puts "#{dish.name} X#{amount} -- £#{dish.price * amount}"
                printed_dishes << dish
            end
        end
        puts "Total: £#{total}"
    end

    def check_order?
        puts "Confirm order Y/N:"
        input = gets.chomp
        case input.downcase
        when "y"
            true
        when "n"
            false
        end
    end



end