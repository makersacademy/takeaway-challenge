class Menu
attr_reader :menu

  def initialize
    @menu = [ { name: "Spring rolls", price: 2 },
    { name: "Char Sui bun", price: 3.99 },
    { name: "Pork dumpling", price: 2.99 },
    { name: "Peking duck", price: 7.99 },
    { name: "Fu-king fried rice", price: 5.99 },
    { name: "Egg fried rice", price: 3.99 },
    { name: "Pickled egg", price: 1.99 },
    { name: "Sweet and sour chicken", price: 6.99 } ]
  end

  def full_menu
    @menu.each do |item|
      puts "#{ item[:name] } - £#{ menu[:price] }\n"
    end
  end
end
