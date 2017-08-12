require 'csv'

class Menu

  def print_menu_header
    puts "Welcome to Adbuls OK late night eatery. Open 25-7. Food for your future self."
  end

  def open_menu
    CSV.open("menu.csv", "r")
  end

  def print_menu
    self.open_menu do |newfile|
      newfile.readlines.each do |line|
        puts "#{line}"
      end
    end
  end

end







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
