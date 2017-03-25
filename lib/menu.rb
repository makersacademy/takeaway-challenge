class Menu
  CSV_MENU_FILEPATH = './menu.csv'
  def initialize
    @menu = ["Test"]

  end

  def view
    menu.dup
  end

  def menu_entry_maker(food,price)
    {
      food: food,
      price: price
    }
  end

  private
  attr_reader :menu
end
