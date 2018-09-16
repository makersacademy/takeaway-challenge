class Order
  attr_reader :basket, :menu, :printer

  def initialize(menu = Menu.new, printer = Printer.new)
    @basket = []
    @menu = menu
    @printer = printer
  end

  def add(name, qty = 1)
    choice = search_menu(name)
    raise("Dish not in menu!") unless choice
    search_basket(choice) ? update_entry(choice, qty) : add_entry(choice, qty)
  end

  # returns true if dish object already inside basket
  def search_basket(dish)
    basket.any? { |order| order[:dish] == dish }
  end

  # returns false if not in menu, else returns dish object
  def search_menu(name)
    menu.list.detect { |order| order.name == name }
  end

  def add_entry(dish, qty = 1)
    basket << { dish: dish, qty: qty }
  end

  def update_entry(dish, qty = 1)
    basket.each { |entry| entry[:qty] += qty if entry[:dish] == dish }
  end
end

=begin
first look through menu to see if meal exists or raise error
then look through basket to see if meal exists and += quantity
finally look through menu again and add dish object and quanity



sum
go through baskets objects, get subtotal and add as key value to hash
then send to print (or leave that under display?



=end
