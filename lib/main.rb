#Understands responsibility to manage inital section of customer journey
require_relative "italian"

class Main

  attr_reader :options

  def initialize
    @food = Italian
    welcome
    options
  end

  def options
    loop do
      options_list
      break
      #choice(gets.chomp)
    end
  end


  private

  attr_reader :welcome, :options_list

  def welcome
    puts "Welcome, please select a number from the list below to progress."
  end

  def options_list
    puts ""
    puts "Choose option"
    puts "1. View menu"
    puts "2. Create new basket"
    puts "3. Add items to basket"
  end

  def choice(select)
    case select
    when "1"
      print_menu
    when "2"
      Basket.new
    when "3"
      Basket.add_to_cart
    else
      puts "I'm not sure what you mean, please choose a number."
    end
  end

  def print_menu
    @food.new.menu.each.with_index(1) do |(item,price), index|
      puts "#{index}.#{item} --- £#{price}"
    end
  end

  def menu_select
    puts "input the number you want and hit enter. To finish, hit enter twice."
    until gets.chomp == "" do
      @item = @food.menu[(gets.chomp) -1]
      Basket.add_to_cart(@item)

end
