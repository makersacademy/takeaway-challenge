class TakeAway

  def initialize
    @menu = default_menu
  end

  def default_menu
    menu = Menu.new
    menu.add(Dish.new("spring roll" , 0.99))
    menu.add(Dish.new("char sui bun" , 3.99))
    menu.add(Dish.new("pork dumpling" , 2.99))
    menu.add(Dish.new("peking duck" , 7.99))
    menu.add(Dish.new("fu-king fried rice" , 5.99))
    return menu
  end

  def read_menu
    menu_hash = Hash.new(0)
    @menu.dishes.each do |dish|
    menu_hash.store("#{dish.name}", dish.price)
    end
    return menu_hash
  end

end
