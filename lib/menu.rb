class Menu
  attr_reader :menu

  def initialize
    @menu = [{ item: "Pizza", price: 7 },
      { item: "Fried Rice", price: 3 },
      { item: "Burger and Chips", price: 7 },
      { item: "Fish and Chips", price: 8 },
      { item: "Chips", price: 2 }
    ]
  end

  def see_menu
    @menu.each { |item|
      puts "#{item[:item]} - £#{item[:price]}"
    }
  end
end
