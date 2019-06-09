class Menu

  attr_reader :dishes
  
  DEFAULT_MENU = {
      spring_rolls: 5,
      wonton: 10,
      congee: 10,
      chow_mein: 15,
      hotpot: 20
    }

  def initialize(dishes = DEFAULT_MENU)
    @dishes = dishes
  end

  def print_menu
    @dishes.map do |name, price|
      "#{name.to_s.split("_").map(&:capitalize).join(" ")}: £#{price}"
    end.join(", ")
  end 
end

# menu = Menu.new
# menu.print_menu
