require_relative 'text.rb'
require_relative 'google_sheet.rb'
require_relative 'formatting.rb'
class EdsDiner
  
  include Formatting

  def initialize 
    @dishes = {}
    @current_order = {}
    @order_options = {
      "1" => {:name => "Show Menu", :method => method(:show_menu)}, 
      "2" => {:name => "Add To Order", :method => method(:select_dishes)},
      "3" => {:name => "Show Current Order", :method => method(:order_summary)},
      "4" => {:name => "Remove Item From Order", :method => method(:remove_items)},
      "5" => {:name => "Order", :method => method(:place_order)}
    }
    @text = Text.new
  end

  attr_accessor :dishes, :current_order

  def order
    load_menu if @dishes == {}
    clear_terminal
    title("Welcome to EdsDiner!")
    while true do
      puts yellow("\nHow can we help today? (choose number (e.g. 1) or type 'quit' to leave")
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
    title("Select item by number (e.g. 1) or 'quit' to return to menu")
    while true do
      break if handle_select(get_input) == "quit"
    end
  end

  def order_summary
    clear_terminal
    
    @current_order == {} ? no_items : print_current_order
  end

  def place_order
    clear_terminal
    @current_order == {} ? no_items : submit_order
  end

  def remove_items
    @current_order == {} ? no_items : handle_delete
  end

  private

  def handle_delete
    show_menu
    print_current_order
    puts yellow("\nTo delete an item from your order, find its number from the menu and enter the quantity to delete")
    item , quantity = get_item, get_quantity
    return if delete(item,quantity) == "not there"
  end

  def get_item
    puts "Item Number:"
    gets.chomp
  end

  def get_quantity
    puts "Quantity To Remove"
    gets.chomp.to_i
  end

  def delete(item,quantity)
   if @current_order[item] 
    quantity >= @current_order[item] ? @current_order.delete(item) : @current_order[item] -= quantity
    puts green("You have successfully #{red("removed")} #{green(quantity)} x #{@dishes[item][:name]}")
   else
    puts red("You don't have that #{@dishes[item][:name]} on your order.")
    return "not there"
   end
  end

  # I had a look at Mabons code: https://github.com/Maby0/takeaway-challenge
  # Liked the use of CSV
  # Decided to try and do the same but for google sheets. 

  def load_menu
    menu = Menu.new
    menu.get_dishes
    @dishes = menu.dishes
  end

  def submit_order
    random = rand(100000)
    handle_text_response(send_text(random), random)
  end

  def handle_text_response(response, random)
    if ["4","5"].include?(response[:code][0])
      puts response[:error]
    else
      puts "Order Confirmation: #{random}\n\n\n\n\n\n\n"
      exit
    end
  end

  def send_text(random)
    @text.send("Thank you! order #{random} was placed and will be delivered before #{hour_from_now}")
  end

  def hour_from_now
    time = Time.now + (10 * 60) * 6
    "#{time.hour}:#{time.min < 10 ? "0#{time.min}" : time.min}"
  end

  def no_items
    puts red('There are no items in your current order')
  end

  def print_current_order
    title("Your Order Summary:")
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
    @order_options[input] ? perform_selection(input) : invalid_selection
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
    @dishes[item] ? confirm_item_added(item) : invalid_selection
  end

  def invalid_selection
    puts red("Invalid Selection")
  end

  def confirm_item_added(item)
    @current_order[item] ? @current_order[item] += 1 : @current_order[item] = 1
    puts green("You have added 1x #{dishes[item][:name]} to your order")
  end


  def get_input
    input = gets.chomp
  end

  def title(text)
    puts " "
    puts blue(text)
    ((text.length) - 1).times { print blue("~") }
    puts blue("~")
  end

  def clear_terminal
    puts `clear`
  end
end
