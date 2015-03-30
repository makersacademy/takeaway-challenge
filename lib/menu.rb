require_relative 'display_output'

class Menu
  include DisplayOutput
  attr_reader :items
  def initialize dish_list
    @items = dish_list.list
  end

  def show_menu
    header = ['Order code', 'Name', 'Price']
    display_list header, items
  end
end
