class PrintMenu
  attr_reader :menu

  def initialize
    @menu = [
      {dish: "Egg fried rice", price: 3},
      {dish: "Beef fried rice", price: 5},
      {dish: "Kung pao chicken", price: 7},
      {dish: "Lemon chicken", price: 6},
      {dish: "Chili shredded beef", price: 5},
      {dish: "Peking duck", price: 12}
    ]
  end
#
  def see_menu_list
    @menu.each.with_index { |menu_item, index|
      puts "#{index + 1}. #{menu_item[:dish]}: $#{menu_item[:price]}"
    }
  end
end
