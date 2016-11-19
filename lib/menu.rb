class Menu

  attr_accessor :menu_list

  def initialize
    @menu_list = {
      :spag_bol => 6,
      :pizza => 4
    }
  end

  def view_menu
    self.menu_list
  end


end
