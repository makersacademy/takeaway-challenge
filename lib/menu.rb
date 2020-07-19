class Menu
  attr_reader :items
  def initialize
    @items = [
        { name: "Chicken Wings", price: "3.00" },
        { name: "Burger", price: "4.00" },
        { name: "Chips", price: "2.50" },
        { name: "Doner Kebab", price: "5.50" },
        { name: "Drink", price: "1.50" }
      ] 
  end
end
