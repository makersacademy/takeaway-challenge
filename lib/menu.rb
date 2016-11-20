class Menu

  attr_accessor :menu_list

  def initialize
    @menu_list = {
      "Spag_Bol" => 6.5,
      "Pizza" => 4,
      "Chips" => 2.75
    }
  end

  def view_menu
    self.menu_list
  end

end
