require_relative 'takeaway'

class Menu

  attr_reader :menu_list

  DISH_LIST = {
    "pizza" => 5,
    "kebab" => 4,
    "burger" => 6,
    "tacos" => 4,
    "chips" => 1,
  }

  def initialize
    @dishes = DISH_LIST
  end

  def menu_list
    @dishes.each do |item, price|
      puts "#{item}: £#{price}"
    end
  end

end
