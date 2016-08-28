class Menu
#shows list of dishes and prices
  def initialize(menu = @menu)
    @menu = {
        "wild boar sandwich" => 7.50,
        "venison pie" => 7.50,
        "beef wellington" => 7.00,
        "pulled pork slider" => 7.00,
        "lobster nicoise" => 9.50,
        "vegan platter" => 7.00
      }
  end

  def print_menu
      menu
  end

  private

  attr_reader :menu

end
