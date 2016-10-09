$dishes = [
{name: "Pasta", price: 3.50},
{name: "Pizza", price: 2.40}
]
require_relative 'order'
require_relative 'menu'
require_relative 'sms'

class UserInterface

  attr_reader :choices

  def initialize(menu_class=Menu, order_class=Order, sms_class=SMS)
    @choices = ["view menu", "select dish", "view order summary", "confirm order", "bill subtotal", "quit"]
    @messenger = sms_class.new
    @order = order_class.new(@messenger)
    @menu = menu_class.new($dishes, @order)
  end

  def launch!
    introduction
    result = nil
    until result == :quit
      user_choice = get_choice
      result = execute_the(user_choice)
    end
  end

  def choices
    @choices.dup
  end

  def introduction
    puts "Welcome to the Takeaway App\n\n"
    puts "These are your options:\n\n"
    list_options
    puts "\n\n"
    puts "What would you like to do?"
  end

  def get_choice
    choice = nil
    until @choices.include?(choice)
      if choice
        puts "I don't understand that command...\n"
        puts "These are the list of available options:"
        list_options
      end
      puts ">"
      choice = gets.chomp.downcase
    end
    choice
  end

  def execute_the(user_choice)
    case user_choice
    when "view menu"
      @menu.view
    when "select dish"
      puts "Which dish do you want to select from the menu?"
      dish_choice = gets.chomp.downcase
      @menu.add_dish_to_order(dish_choice)
    when "view order summary"
      @order.summary
    when "bill subtotal"
      @order.bill
    when "confirm order"
      @order.confirm_order
    when "quit"
      :quit
    end
  end

  private

  def list_options
    @choices.each do |choice|
      puts "#{choice}"
    end
  end

end
