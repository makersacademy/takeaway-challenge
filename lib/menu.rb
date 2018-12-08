class Menu

  attr_reader :menu

  def initialize
    @menu = [
      { "pizza_1®": 1 },
      { "pizza_3®": 2 },
      { "pizza_3®": 3 },
      { "pizza_4®": 4 },
      { "pizza_5.0®": 5 }
    ]
  end

  def display_menu
    @menu.each {
      |item| item.each {
        |name, price| "#{name}:£#{price}"
      }
    }
  end

end
