require 'csv'

class Menu

  attr_reader :dishes, :menu_csv

  def initialize
    @menu_csv = CSV.read('lib/menu.csv', :encoding => 'windows-1251:utf-8')
  end

  def view_menu
    print_menu
  end

  def menu_load
    @menu.each do |row|
    end
  end











  private

  def print_menu
    puts ".--------------------------------------------."
    puts "|  .___  ___.  _______ .__   __.  __    __   |"
    puts "|  |   \\/   | |   ____||  \\ |  | |  |  |  |  |"
    puts "|  |  \\  /  | |  |__   |   \\|  | |  |  |  |  |"
    puts "|  |  |\\/|  | |   __|  |  . `  | |  |  |  |  |"
    puts "|  |  |  |  | |  |____ |  |\\   | |  `--'  |  |"
    puts "|  |__|  |__| |_______||__| \\__|  \\______/   |"
    puts ":--------------------------------------------:"
    puts "| ITEM                             | PRICE   |"
    @menu_csv.each do |row|
      puts":----------------------------------+---------:"
      price = '%.2f' % row[1]
      string = "| " + row[0].ljust(33) + "| " + price.to_s.ljust(8) + "|"
      puts string
    end
      puts"'----------------------------------'---------'"
  end
end
