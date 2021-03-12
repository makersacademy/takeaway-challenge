require 'csv'

class Menu 

  attr_reader :menu_list

  def initialize
    @menu_list = load_menu_items
  end

  def load_menu_items
    @menu_list = CSV.open('./lib/menu_items.csv', headers: :first_row, 
    header_converters: :symbol, converters: :all).map(&:to_h)
  end

  def search_menu_items(input)
    @menu_list.find { |dish| dish[:number] || dish[:name] == input }
  end
end
