class DishList
  MENU = { dish1: 10, dish2: 14, dish3: 9 }

  def show_menu
    MENU.each do |name, price|
      p "#{name} : £#{price}"
    end
  end
end
