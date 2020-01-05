class Takeaway
  RESTURANT_NAME = "TAKEAWAY à la CHRIS\n"

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
    menu = @menu_printer.print_menu({headers: @menu_labels, items: @menu_items})
    how_to_order = "Please use the following comma seperated order format whether ordering directly or via text: '<item1>, <quantity>, <item2>, <quantity>, etc..., <total_price>, <long_format_phone_number>' "
    RESTURANT_NAME + menu + how_to_order
  end

  def place_order(order)
    raise 'Order not in correct format' if order.class != String
    raise 'Order not in correct format' unless order.match?(/(\A(\s*\w+, \d+,)+)(?= \d+, \+44\d{10})/)
    'Order recieved, you should recieve a text confirmation shortly!'
  end
end

# require './lib/takeaway.rb'
# require './lib/menu_printer.rb'
#
# a = Takeaway.new(MenuPrinter.new)
# a.show_menu
