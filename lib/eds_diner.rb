require 'dotenv/load'
require 'twilio-ruby'

class EdsDiner

  def initialize 
    @dishes = { "1"=> { :name => "Tomato Soup", :price => 5 }, "2" =>{ :name => "Avocado On Toast", :price => 7 }, "3" => { :name => "Spaghetti Bolognese", :price => 12 }, "4" => { :name => "Mushroom Surprise", :price => 9 }, "5" => { :name => "Pizza", :price => 10 }, "6" => { :name => "Ice Cream", :price => 4}, "7" =>{ :name => "Cake", :price => 4 }} 
    @current_order = {}
    @order_options = {
      "1" => {:name => "Show Menu", :method => method(:show_menu)}, 
      "2" => {:name => "Add To Order", :method => method(:select_dishes)},
      "3" => {:name => "Show Current Order", :method => method(:order_summary)},
      "4" => {:name => "Order", :method => method(:place_order)}
    }
  end

  attr_reader :dishes, :current_order

  def order
    clear_terminal
    title("Welcome to EdsDiner!")
    while true do
      puts "\nHow can we help today? (choose number (e.g. 1) or type 'quit' to leave"
      break if handle_instruction == "quit"
    end
  end

  def show_menu 
    clear_terminal
    title("EdsDiner Menu:")
    @dishes.each do |number, dish| 
      puts "#{number}. #{dish[:name]}  £#{dish[:price]}"
    end
    puts " "
  end

  def select_dishes
    show_menu
    title("Select item by number (e.g. 1) or 'quit'")
    while true do
      break if handle_select(get_input) == "quit"
    end
  end

  def order_summary
    clear_terminal
    title("Your Order Summary:")
    @current_order == {} ? no_items : print_current_order
  end

  def place_order
    clear_terminal
    @current_order == {} ? no_items : submit_order
  end


  private

  def text(message)
    client = Twilio::REST::Client.new ENV['SID'], ENV['TOKEN']
    message = client.messages.create( 
                             body: message,  
                             messaging_service_sid: ENV['MESSAGEID'],      
                             to: ENV['MYNUM'],
                           ) 
    message.sid
  end

  def submit_order
    random = rand(100000)
    puts "Order Confirmation: #{random}\n\n\n\n\n\n\n"
    text("Thank you! order #{random} was placed and will be delivered before #{hour_from_now}")
    exit
  end

  def hour_from_now
    time = Time.now + (10 * 60) * 6
    "#{time.hour}:#{time.min}"
  end

  def no_items
    puts 'There are no items in your current order'
  end

  def print_current_order
    total = 0
    @current_order.each do |dish,quantity|
      puts "#{quantity}x #{@dishes[dish][:name]} @ £#{@dishes[dish][:price]} = £#{@dishes[dish][:price] * quantity}"
      total += @dishes[dish][:price] * quantity
    end
    puts "Total = £#{total}"
  end

  def handle_instruction
    show_instructions
    input = get_input
    return "quit" if input == "quit"
    @order_options[input] ? perform_selection(input) : (puts "Invalid Selection")
  end

  def perform_selection(input)
    @order_options[input][:method].call
  end

  def show_instructions
    @order_options.each do |num, option| 
      puts "#{num}. #{option[:name]}"
    end
  end

  def handle_select(item)

    if item == "quit"
      clear_terminal
      return "quit"
    end
     @dishes[item] ? confirm_item_added(item) : (puts "Invalid Selection")

  end


  def confirm_item_added(item)
    @current_order[item] ? @current_order[item] += 1 : @current_order[item] = 1
    puts "You have added 1x #{dishes[item][:name]} to your order"
  end


  def get_input
    input = gets.chomp
  end

  def title(text)
    puts " "
    puts text
    ((text.length) - 1).times { print "~" }
    puts "~"
  end

  def clear_terminal
    puts `clear`
  end
end
