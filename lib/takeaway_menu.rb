class TakeawayMenu

  attr_reader :menu

  DEFAULT_MENU = [
    {dish: "pizza",       price: 5},
    {dish: "pasta",       price: 3},
    {dish: "panzenella",  price: 2},
    {dish: "tiramisu",    price: 3}
  ]
  DEFAULT_CUISINE = "Italian"

  def initialize(menu = DEFAULT_MENU)
    @menu = menu
  end

  def show_menu
    @menu.each do |menu_item|
       print_a_menu_item(menu_item)
    end
  end


  def from_the_menu?(dish)
    @menu.each do |menu_item|
      return true if dish_is_found?(menu_item, dish)
    end
    false
  end


  def dish_price(dish)
    @menu.each do |menu_item|
      return menu_item[:price] if dish_is_found?(menu_item, dish)
    end
  end



  private

  def print_a_menu_item(menu_item)
    space = 15
    puts ("#{menu_item[:dish]}:".ljust(space) + "#{menu_item[:price]}")
  end

  def dish_is_found?(menu_item, dish)
     menu_item[:dish] == dish.downcase
  end
end
