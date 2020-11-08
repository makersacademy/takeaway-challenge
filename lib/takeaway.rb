class Takeaway
  def initialize(menu_instance)
    @menu_instance = menu_instance
  end

  def print_menu
    dishes = ""
    @menu_instance.menu.each do |dish|
      dishes += "#{dish[:name]}: #{dish[:price]}" + "\n"
    end
    return dishes
  end

end
