class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      Potato: 1,
    }
  end

  def print_menu
    puts "Menu:"
    @dishes.each do |dish, price|
      # set the menu to print out with prices at 2 decimal places
      puts "#{dish}: £#{'%.2f' % price}"
    end
  end

end
