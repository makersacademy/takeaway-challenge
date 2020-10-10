require 'twilio-ruby'

class Order
  DISHES = [
    { id: "001", item: "Pepperoni Pizza", price: "7.99" },
    { id: "002", item: "Margherita Pizza", price: "7.49" },
    { id: "003", item: "Chips", price: "3.00" },
    { id: "004", item: "Onion Rings", price: "3.50" },
    { id: "005", item: "Diet Coke", price: "2.50" },
    { id: "006", item: "Fanta", price: "2.50" }
  ]

  def initialize
    @order_list = []
  end

  def print_menu
    puts "Menu:"
    puts "-----"
    DISHES.each do |item|
      puts "ID#{item[:id]} - £#{item[:price]} : #{item[:item]}"
    end
  end

  def order
    loop do
      puts "Please enter the FULL ID number or 'end' to finish ordering: "
      order_id = gets.chomp
      break if order_id == 'end'

      order_item = DISHES.select { |item| item[:id] == order_id }
      puts "Please enter quantity of #{order_item[0][:item]}"
      order_quantity = gets.chomp
      @order_list.push([order_id, order_quantity])
    end
  end

  def print_order
    if @order_list.empty?
      puts "You haven't ordered yet!..."
    else
      puts "Your Order:\n\n"
      @order_list.each { |each|
        order_select = Order::DISHES.select { |item| item[:id] == each[0] }
        print "£#{((order_select[0][:price]).to_i * each[1].to_i)} "
        puts ": #{each[1]} x #{order_select[0][:item]}"
      }
      puts "-----"
      puts "Is this correct?: yes/no"
      correct = gets.chomp.downcase
      send_text if correct == 'yes'
    end
  end

  def send_text


    account_sid = "AC810cf7bae5eaa39ee0e06e4d4a352d1b" # Your Test Account SID from www.twilio.com/console/settings
    auth_token = "854d97b650853ff3ffe9da7f1200a34b"   # Your Test Auth Token from www.twilio.com/console/settings

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Hello from Ruby",
        to: "+447526789279",    # Replace with your phone number
        from: "+447401196761")  # Use this Magic Number for creating SMS

    puts message.sid
  end

  attr_reader :order_list
end
