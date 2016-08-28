#Understands responsibility to manage inital section of customer journey
require_relative "italian"

class Main

  attr_reader :options

  def initialize
    welcome
    options
  end

  def options
    loop do
      options_list
      choice(gets.chomp)
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
    puts "2. Add items to basket"
  end

  def choice(select)
    case select
    when "1"
      print_menu
    when "2"
      #initialize basket
    else
      puts "I'm not sure what you mean, please choose a number."
    end
  end

  def print_menu
    Italian.new.menu.each.with_index(1) do |(item,price), index|
      puts "#{index}.#{item} --- £#{price}"
    end
  end

end
