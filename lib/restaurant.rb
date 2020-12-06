class Restaurant
  attr_reader :menu

  def initialize
    @menu = {
      burgers: 3.0,
      falafel: 4.5,
      burrito: 6.5,
      lasagna: 7.0,
      quiches: 5.5
    }
  end

  def print_menu
    puts ""
    puts "+==============================+"
    puts " Welcome to Ara's Vegan Canteen "
    puts "+==============================+"
    puts "       item      |     price   |"
    puts " ---------------- -------------- "
    menu.each do |name, price|
      print "|     "
      print name
      print "    |      "
      print price
      print "    |    "
      print "\n"
    end
    puts ""
  end
end
