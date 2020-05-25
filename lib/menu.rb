class Menu
  attr_reader :dishes

  MY_MENU = { :marguerita => 8, :regina => 10, :buffala => 13, :diavola => 12, :romana => 11 }

  def initialize
    @dishes = MY_MENU
  end

  def print_menu
    @dishes.map do |key, value| 
      puts "* Pizza #{key}: £#{value}"
    end
  end
end
