require_relative 'customer'

class Menu

  def initialize
    @menu = [{:item => 'Cod', :price => '£9.50', :item => 'Chips', :price => '£2.50'}]
  end

  def show_menu
    @menu = @current_menu

  end

end