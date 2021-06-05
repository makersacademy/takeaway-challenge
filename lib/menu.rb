class Menu
  attr_reader :menu_list

  def initialize
    @menu_list = {
      burger: 6.99,
      hotdog: 6.99,
      pizza: 7.50,
      fries: 2.99,
    }
  end

  def show_menu 
    @menu_list
  end
end
