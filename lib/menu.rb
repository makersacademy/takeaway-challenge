require_relative 'menu_item'

class Menu

attr_reader :menu

  def initialize
    @menu_list = []
  end

  def add_item(item)

    @menu_list << item

  end

  def list_menu
    @menu_list

  end



end
