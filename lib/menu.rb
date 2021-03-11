require 'csv'

class Menu 

  attr_reader :menu_list

  def initialize
    @menu_list = Array.new
  end

  def load_menu_items
    @menu_list = CSV.open('./lib/menu_items.csv', headers: :first_row, 
    header_converters: :symbol, converters: :all).map(&:to_h)
  end
end
