class Menu

  attr_reader :menu

  def initialize
    @menu = { "Butternut Squash Wrap": 3.95,
        "Spicy Mixed Bean Wrap": 3.95,
        "Goji Mushroom Burger": 4.95,
        "Soup of the day": 2.95,
        "Carrot cake": 2.95 }
  end

  def show_menu
    @menu.each { |key, value| puts "#{key}, £#{value}" }
  end
end
