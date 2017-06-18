class Menu

  attr_reader :menu, :mexican_menu

  MEXICAN_MENU = [
          { menu_item: :vegetarian_enchiladas, price: 9.99 },
          { menu_item: :vegetarian_tacos, price: 9.99 },
          { menu_item: :vegetarian_chimichangas, price: 9.99 },
          { menu_item: :vegetarian_burrito, price: 9.99 },
          { menu_item: :chile_relleno, price: 3.99 },
          { menu_item: :vegetarian_taquitos, price: 4.99 }
         ]

  def initialize(menu = MEXICAN_MENU)
    @menu = menu
  end

  def print_menu
    @menu.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:menu_item]} : $#{item[:price]}"
    end
  end

end
