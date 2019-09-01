class Takeaway
  MENU = [
    { item: "Fish", price: 7 },
    { item: "Shish kebab", price: 7 },
    { item: "Kofta kebab", price: 6 },
    { item: "Pepperoni pizza", price: 8 },
    { item: "Steak pie", price: 3 },
    { item: "Small chips", price: 2 },
    { item: "Large chips", price: 3 },
    { item: "Salad", price: 3 },
    { item: "Coke", price: 2 },
    { item: "Diet Coke", price: 2 },
    { item: "San Pellegrino Lemon", price: 2 }
  ]
  def initialize
    @menu = MENU
  end

  def show_menu
    @menu.each do |menu_line|
      puts "#{menu_line[:item]}: #{menu_line[:price]}"
    end
  end
end
