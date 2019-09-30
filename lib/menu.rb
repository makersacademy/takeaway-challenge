class Menu
  attr_reader :list

  def initialize
    @list = {
        pizza: 5,
        curry: 7,
        kebab: 4,
        ramen: 9,
      burger: 5
    }

  end

  def print_menu
    list
  end
end
