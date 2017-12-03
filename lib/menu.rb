require_relative 'order'

class Menu
  
  def print_dishes(menu = menu_items)
    menu.each_with_index do |dishes_list, index|
      dishes_list.each do |dish_name, dish_price|
        beginning = "#{index + 1}.  #{dish_name}"
        ending = "#{dish_price}"
        puts(beginning.ljust(30) + ending.rjust(10))
      end
    end
  end

  def menu_items
    [
      { Mixed_Kebab: 2.50 },
      { Chicken_Pakora: 2.70 },
      { Chicken_Tikka: 2.50 }
    ]
  end

end 
