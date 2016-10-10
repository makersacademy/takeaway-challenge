class Menu
  attr_reader :menu, :pizza, :price

  def initialize
  @menu = [{:pizza => 'Margherita', :price => 8},
  {:pizza => 'Napolitana', :price => 10},
  {:pizza => 'Fiorentina', :price => 8},
  {:pizza => 'Funghi', :price => 9},
  {:pizza => 'Siciliana', :price => 9},
  {:pizza => 'American', :price => 7},
  {:pizza => 'Hawaiian', :price => 8},
  {:pizza => 'Vegetarian', :price => 9},
  {:pizza => 'Pollo', :price => 10},
  {:pizza => 'Carne', :price => 10}]
  end

  def print_menu
    @menu.each_with_index {|item, index| puts "#{index+1}. #{item[:pizza]}: £#{item[:price]}"}
  end
end
