require 'csv'

class Menu

  def print_menu_header
    puts "Welcome to Adbuls OK late night eatery. Open 25-7. Food for your future self."
  end

  def print_menu
    counter = 0
    CSV.open("menu.csv", "r") do |newfile|
      newfile.readlines.each do |line|
        menu_options = "#{counter+=1}." + " " "#{line.to_s}"
        puts "#{menu_options}\n"
      end 
    end
  end
end

# menu= Menu.new
# menu.print_menu

  # attr_accessor :menu_hash
  #
  # def initialize
  #   @menu_hash = {}
  # end

  # def prints_menu_list
  # #   CSV.open(menu_list. "r") do |newfile|
  # #     newfile.readlines.each do |line|
  # #       puts "#{line}"
  # # end

#   def creating_the_menu_hash
#      @menu_hash["1. Metalic fried virus"] = 9.99
#      p "#{menu_hash}"
#
# #NO it should only open then print a CSV file which contains the info .. look at student directory stuff for how to do this
#   end
