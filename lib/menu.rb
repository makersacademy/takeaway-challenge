require 'csv'
require_relative './creating_menu.rb'

class Menu

  def print_menu_header
    puts "Welcome to Adbuls OK late night eatery. Open 25-7. Food for your future self."
  end

  def print_menu
    counter = 0
    CSV.open("menu.csv", "r") do |newfile|
      newfile.readlines.each do |line|
        menu_options = "#{counter += 1}." + " " "#{line.to_s}"
        puts "#{menu_options}\n"
      end
    end
  end

  def show_menu_hash
    counter = 0
    Creating_menu.new.hash_of_menu.each do |key, value|
      puts "#{counter += 1}." "#{key}: " + "$" "#{value}"
    end
  end
end

menu= Menu.new
menu.show_menu_hash
# menu.print_menu
