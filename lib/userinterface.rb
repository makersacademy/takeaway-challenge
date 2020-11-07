require_relative './menu'
require_relative './order'

class UserInterface

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    @complete = false
  end

  def begin
    puts "Welcome to Rough Randy's Road Roasts, please take your time to browse the menu and order when you are ready."
    print_menu
    create_order # more stuff after this, relating to the texting ability
  end


  #could be private

  def create_order
    while !@complete
      customer_choices
      process(STDIN.gets.chomp)
    end
  end

  def customer_choices
    puts "Enter a number from the list below to take the action"
    puts "1. Add item to basket"
    puts "2. Remove item from basket"
    puts "3. View menu"
    puts "4. View order"
    puts "5. Complete order"
  end

  def process(selection)
    case selection
    when "1"
      add_item
    when "2"
      remove_item
    when "3"
      print_menu
    when "4"
      @order.print_order
    when "5"
      complete_order
    end
  end

  def add_item
    puts ""
    puts "Which item would you like to add? (Enter item number)"
    choice = customer_selection
    puts "You have chosen \"#{get_name(choice)}\", how many would you like to add?"
    quantity = STDIN.gets.chomp.to_i
    @order.add_to_order(get_name(choice), quantity, get_price(choice))
    puts ""
  end

  def remove_item
    puts ""
    puts "Which item would you like to remove? (Enter item number)"
    choice = customer_selection
    puts "You have chosen \"#{get_name(choice)}\", how many would you like to remove?"
    quantity = STDIN.gets.chomp.to_i
    @order.remove_from_order(get_name(choice), quantity)
    puts ""
  end

  def complete_order
    puts ""
    puts "Your total is £#{'%.2f' % (@order.total.to_f/100)}"
    puts "Are you sure you want to complete your order? (enter 'yes' to complete)"
    if STDIN.gets.chomp.downcase == "yes"
      @complete = true
    else
      puts "Continuing with order"
    end
    puts ""
  end


  # definitly private

  def print_menu
    puts ""
    puts "Rough Randy's Road Roasts menu:"
    @menu.print_menu
    puts ""
  end

  def get_name(item_number)
    @menu.menu.each do |item|
      return item[:name] if item[:number] == item_number
    end
  end

  def get_price(item_number)
    @menu.menu.each do |item|
      return item[:price] if item[:number] == item_number
    end
  end

  def customer_selection
    choice = STDIN.gets.chomp
    while !@menu.menu.map { |e| e[:number] }.include?(choice)
      puts "You entered an invalid selection, please choose again."
      choice = STDIN.gets.chomp
    end
    choice
  end

end
