class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      spring_rolls: 5,
      wonton: 10,
      congee: 10,
      chow_mein: 15,
      hotpot: 20
    }
  end

  def list_menu
    @dishes.map do |name, price|
      "#{name.to_s.split("_").map(&:capitalize).join(" ")}: £#{price}"
    end.join(", ")
  end 
end

# menu = Menu.new
# menu.list_menu
