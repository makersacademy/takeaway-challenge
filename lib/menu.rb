require 'csv'



def view_menu
  menu = CSV.read('menu.csv', :encoding => 'windows-1251:utf-8')
  puts ".--------------------------------------------."
  puts "|  .___  ___.  _______ .__   __.  __    __   |"
  puts "|  |   \\/   | |   ____||  \\ |  | |  |  |  |  |"
  puts "|  |  \\  /  | |  |__   |   \\|  | |  |  |  |  |"
  puts "|  |  |\\/|  | |   __|  |  . `  | |  |  |  |  |"
  puts "|  |  |  |  | |  |____ |  |\\   | |  `--'  |  |"
  puts "|  |__|  |__| |_______||__| \\__|  \\______/   |"
  puts ":--------------------------------------------:"
  puts "| ITEM                             | PRICE   |"

  menu.each do |row|
    puts":----------------------------------+---------:"
    price = '%.2f' % row[1]
    string = "| " + row[0].ljust(33) + "| " + price.to_s.ljust(8) + "|"
    puts string
  end

    puts"'----------------------------------'---------'"
end


view_menu
