class Menu
  attr_accessor :list_of_dishes

  def initialize
    @list_of_dishes = []
  end

  def add_to_menu(dish)
    @list_of_dishes.push(dish.itemise)
  end

  def access_menu
    @list_of_dishes = DEFAULT_MENU
  end

  def view_menu
    access_menu if @list_of_dishes.empty?
    banner_display
    menu_display
  end

  private

  def menu_display
    format = []
    @list_of_dishes.each do |item| 
      item.each { |dish, price| format << "TD-Dish: #{dish} // Price: £#{price}" }
    end
    format.join("\n")
  end

  def banner_display
    return "*** TDD Greasy Spoon ***".center(20)
  end

  DEFAULT_MENU = [
    { "Hash brown" => 0.99 },
    { "Egg roll" => 2.99 },
    { "Bacon bap" => 2.99 },
    { "Sausage sandwich" => 3.99 },
    { "Full English" => 6.99 },
    { "Veggie Breakfast" => 5.99 }
  ].freeze
end
