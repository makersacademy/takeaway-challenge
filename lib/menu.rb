class Menu
  attr_reader :items

  def initialize
    @items = [{ dish: "Hamburger", price: 10 },
    { dish: "Chips", price: 4 },
    { dish: "Orange Juice", price: 2 }
    ]
  end

  def display
    # puts @items.join("\n")
    menu_display = ""
    @items.each.with_index do |item, i|
      menu_display += "#{i + 1}. #{item[:dish]}: #{item[:price]} GBP\n"
    end
    print menu_display
  end
end
