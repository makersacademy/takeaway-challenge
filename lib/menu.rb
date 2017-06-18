class Menu

  attr_reader :menu, :mexican_menu

  MEXICAN_MENU = [
          { item_number: 1, menu_item: :vegetarian_enchiladas, price: 9.99 },
          { item_number: 2, menu_item: :vegetarian_tacos, price: 9.99 },
          { item_number: 3, menu_item: :vegetarian_chimichangas, price: 9.99 },
          { item_number: 4, menu_item: :vegetarian_burrito, price: 9.99 },
          { item_number: 5, menu_item: :chile_relleno, price: 3.99 },
          { item_number: 6, menu_item: :vegetarian_taquitos, price: 4.99 }
         ]

  def initialize(menu = MEXICAN_MENU)
    @menu = menu
  end

  def print_menu
    @menu.each do |item|
      puts "#{item[:item_number]}. #{item[:menu_item]} : $#{item[:price]}"
    end
  end

end
