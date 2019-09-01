class Menu
  attr_reader :menu
  DEFAULT_MENU = [
    { item: 1, name: 'Homemade tomato sauce with freshly chopped basil and buffalo mozzarella (rigatoni)', price: 10},
    { item: 2, name: 'Homemade creamy walnut sauce with chestnut mushrooms (casarecce)', price: 10.5},
    { item: 3, name: 'Smoked salmon (or pancetta) carbonara with pecorino and beaten eggs (bucatini)', price: 13},
    { item: 4, name: '4 hour slow cooked béchamel bolognese with grated parmesan (pappardelle)', price: 12.5},
    { item: 5, name: 'Homemade parmesan, pecorino and basil pesto (casarecce', price: 11},
    { item: 6, name: 'Flaked yellowfin tuna fillet with homemade tomato sauce,peperoncino and freshly chopped parsley (rigatoni)', price: 13},
    { item: 7, name: 'Handmade ravioli with organic lamb, parsley and parmesan in a lightbutter and sage sauce', price: 14}
  ].freeze

  def initialize(menu = DEFAULT_MENU)
    @menu = menu
  end

  def print_menu(menu_in)
    menu_out = ''
    menu_in.each do |menu|
      menu_out << "#{menu[:item]}. #{menu[:name]} - #{menu[:price]} \n"
    end
    menu_out
  end

  def item_available?(item)
    menu.any? { |menu| menu[:item] == item }
  end

  def get_item_price(item)
    menu.select { |menu| menu[:item] == item }.map { |menu| menu[:price] }.pop
  end

end




#




