class Order
  attr_reader :basket, :menu, :printer, :total

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

  def display
    calculate_subtotal
    calculate_total
    format_order
  end

  private
  attr_writer :total

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

  # calls printer.format_order on each entry in @basket, and format_total at end
  def format_order
    basket.each do |entry|
      printer.format_order(entry[:dish].name, entry[:dish].price,
                            entry[:qty], entry[:subt])
    end
    printer.format_total(total)
  end

  # adds subtotal to each hash in @basket
  def calculate_subtotal
    basket.each do |entry|
      entry[:subt] = entry[:dish].price * entry[:qty]
    end
  end

  def calculate_total
    @total = 0
    basket.each { |entry| @total += entry[:subt] }
  end
end
