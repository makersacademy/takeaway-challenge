
class Takaway
  def initialize(menu_printer)
    @menu_printer = menu_printer
    @menu_labels = {name: "Description", category: "Category", price: 'Price'}
    @menu_items = [{name: 'pepperoni_pizza', category: 'Pizza', price: 12.99},
      {name: 'ham_and_mushroom_pizza', category: 'Pizza', price: 12.99},
      {name: 'cheese_pizza', category: 'Pizza', price: 10.99},
      {name: 'tex_mex_pizza', category: 'Pizza', price: 15.99},
      {name: 'wedges', category: 'Side', price: 4.99},
      {name: 'chicken_strippers', category: 'Side', price: 6.99},
      {name: 'garlic_dip', category: 'Side', price: 0.99},
      {name: 'bbq_dip', category: 'Side', price: 0.99},
      {name: 'coke', category: 'Drink', price: 2.99},
      {name: 'fanta', category: 'Drink', price: 2.99},
      {name: 'white_wine', category: 'Drink', price: 7.99},
      {name: 'red_wine', category: 'Drink', price: 7.99}]
  end

  def show_menu
    @menu_printer.print_menu({headers: @menu_labels, items: @menu_items})
  end
end

# require './lib/takaway.rb'
# require './lib/menu_printer.rb'
#
# a = Takaway.new(MenuPrinter.new)
# a.show_menu
