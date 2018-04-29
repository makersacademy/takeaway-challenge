class Menu
  attr_reader :menu

  def initialize
      @menu = [{ item: "Spring rolls", item_price: 2 },
        { item: "Char Sui bun", item_price: 3.99 },
        { item: "Pork dumpling", item_price: 2.99 },
        { item: "Peking duck", item_price: 7.99 },
        { item: "Fu-king fried rice", item_price: 5.99 },
        { item: "Egg fried rice", item_price: 3.99 },
        { item: "Pickled egg", item_price: 1.99 },
        { item: "Sweet and sour chicken", item_price: 6.99 }]
  end

  def full_menu
    @menu.each do |dish|
    puts "#{ dish[:item] } - £#{ dish[:item_price] }\n"
    end
  end
end
