require_relative 'menu.rb'

class Takeaway

  def initialize(menu = Menu.new)
    @food_order = []
    @menu = menu
    @selected_menu
    puts "Welcome to Project Takeaway!"
    select_food_type
  end

  def select_food_type
    puts "What would you like to eat, 'Fish and Chips' or 'Chinese food'?"
    @type = STDIN.gets.chomp.downcase
      if @type == "fish and chips" then @selected_menu = @menu.load_chippy_menu
        main_menu
      elsif @type == "chinese food" then @selected_menu = @menu.load_chinese_menu
        main_menu
      else error_message
        select_food_type
      end
  end

  def main_menu
    loop do
      puts "#{@type.capitalize}, good choice!"
      puts "--------------------------"
      puts "1. "
      puts "2. Show the students"
      puts "3. Save the list to students.csv"
      puts "4. Load the list from sudents.csv"
      puts "5. Show the students, grouped in their respective cohorts"
      puts "9. Exit"
      puts ""
      process(STDIN.gets.chomp)
    end
  end

  def process(selection)
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "5"
        print_cohort
      when "9"
        Exit # HERE THE PROGRAM WILL TERMINATE
      else
        puts " I don't know what you mean, try again"
    end
  end

  def error_message
    "Sorry, I didn't recognise your selection."
  end
end
