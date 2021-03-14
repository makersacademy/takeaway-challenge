class Menu
  attr_reader :dishes

  def initialize
    @dishes = [{ name: "Hamburger", price: 10 },
    { name: "Chips", price: 4 },
    { name: "Orange Juice", price: 2 }
    ]
  end

  def display
    menu_display = "Menu:\n-----\n"
    @dishes.each.with_index do |dish, i|
      menu_display += "#{i + 1}. #{dish[:name]}: #{dish[:price]} GBP\n"
    end
    print menu_display
  end
end
