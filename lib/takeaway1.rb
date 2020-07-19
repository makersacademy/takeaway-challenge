require_relative 'menu'
require_relative 'basket'
require 'twilio-ruby'

def spacer
  puts "------------"
  puts
end

def menu
  puts "Here is the Food Menu:"
  i = 1
  Menu.new.items.each do |item|
    puts "#{i}. #{item[:name]}: £#{item[:price]}"
    i += 1
  end
  spacer
end

def current_basket
  @current_basket ||= Basket.new
end

def view_basket
    puts "Your basket is empty!" unless current_basket.items.count > 0
    current_basket.items.each do |item|
    puts "1 x #{item[:name]} = £#{item[:price]}"
    end
    spacer
    puts "Basket total is: £#{current_basket.show_total}"
    spacer
end

def choose_item
    menu
    puts "Input the number of the item you want added to your basket:"
    user_input = Integer(gets) rescue nil
    @item = Menu.new.items[(user_input-1)]
    puts "Your chosen food item is #{@item[:name]}"
    spacer
    puts "Choose Option 4 - Add Chosen Item To Basket - on the main menu to add it to your basket"
    spacer
end
    
def add_to_basket
    current_basket.add(@item)
    puts "#{@item[:name]} has been added to your basket!"
    spacer
end

def place_order
  account_sid = ENV['ACCOUNT_SID']
  auth_token = ENV['AUTH_TOKEN']
  phone_num = ENV['PHONE_NUM']
  twilio_num = ENV['TWILIO_NUM']
  @client = Twilio::REST::Client.new(account_sid, auth_token)
   
   message = @client.messages.create(
                                 body: "Thank you! Your order was placed and will be delivered before 18:52 ",
                                 from: twilio_num,
                                 to: phone_num
                               )
end

def interactive_menu 
  loop do
    print_menu
    spacer
    puts "Please input the number of the option you want selected:"
    puts
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. View Menu"
  puts "2. View Basket"
  puts "3. Choose Item from Menu"
  puts "4. Add Chosen Item To Basket"
  puts "5. Place Order"
  puts "6. Exit" # 9 because we'll be adding more items
end

def process(selection)
    case selection
      when "1"
        menu
      when "2"
        view_basket
      when "3"
        choose_item
      when "4"
        add_to_basket
      when "5"
        place_order
      when "6"
        exit
      else
        puts "I don't know what you meant, try again"
    end
    spacer
end

interactive_menu