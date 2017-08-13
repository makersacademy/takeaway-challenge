DISHES = {
chicken_chow_mein: 5,
sweet_and_sour_chicken: 5.50
}

class Menu

  attr_reader :dishes

  def initialize
    @dishes = DISHES
  end

  def print_dishes
    @dishes.each do |dish, amount|
      puts "#{dish}: £#{amount}"
    end
  end

end

menu = Menu.new
menu.print_dishes
