require_relative 'order'

class Menu

  def print_dishes(menu = menu_items)
    menu.each_with_index do |dishes_list, index|
      dishes_list.each do |dish_name, dish_price|
        puts("#{index + 1}   #{dish_name}    #{dish_price.to_s.rjust(19)}")
      end
    end
  end

  private

  def menu_items
    [
      {Mixed_Kebab: 2.50},
      {Chicken_Pakora: 2.70},
      {Chicken_Tikka: 2.50}
    ]
  end

end 
