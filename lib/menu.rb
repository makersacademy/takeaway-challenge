class Menu

  attr_reader :menu

  def initialize
    @menu = {fish_burger: 2.0,
            beef_burger: 4.0,
            chicken_burger: 4.0,
            vege_burger: 2.5}
  end

  def read_menu
    @menu.each { |item, price| "#{item}: £#{price}, " }
  end

end
