class DishList
  
  def show_menu
    menu = {dish1: 10, dish2: 14, dish3: 9}
    menu.each do |name, price|
      p "#{name} : £#{price}"
    end
  end
end
