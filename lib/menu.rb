#require 'account'

  def create_account
    puts "Welcome to Chez Suze, please enter your name and hit return"
    input = gets.chomp
    Account.new(input)
  end


  def menu
    loop do
      user_menu
      menu_selection(STDIN.gets.chomp)
    end
  end

  def user_menu
    puts "Welcome to Chez Suze - please choose from the following options"
    puts "Enter the number and hit return"
    puts "1 - view menu"
    puts "2 - choose items"
    puts "3 - view order"
    puts "4 - exit"
  end

  def show_menu
    File.open("./lib/food_list.txt", "r") do |f|
      f.each_line do |line|
        puts line
      end
  end
  end

  def order(input)
    puts "Please enter your order:"
    input = gets.chomp
    order = Order.new(input)
    order.add_item(input)
  end

  def confirm

  end

  def menu_selection(input)
    case input
      when "1"
        show_menu
      when "2"
        order(gets.chomp)
      when "3"
        confirm
      when "4"
        exit
    end
  end

#create_account
menu
