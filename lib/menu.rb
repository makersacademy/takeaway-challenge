require 'smarter_csv'
# contains list of dishes and corresponding prices
class Menu

  attr_reader :dishes

  def initialize
    @dishes = SmarterCSV.process('./Mann_Fang_Lowe_Menu.csv')
  end

  def view
    puts "======================="
    puts "   Mann Fang Lowe Co.  "
    puts "23 Creators St., London"
    puts "======================="
    dishes
  end

end
