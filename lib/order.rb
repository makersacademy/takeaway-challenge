class Order
attr_reader :ordered_items, :menu, :total_price

  def initialize
    @ordered_items = []
    @total_price = []
    @menu = { pizza: 11,
              salad: 6,
              hotdog: 5,
              pasta: 7,
              chicken: 8 }
  end

  def request_menu
    menu.each { |food, price| puts "#{food} - £#{price}" }
    end

  def add(item)
    selection = menu.select { |key| key == item }
    ordered_items << selection.keys[0]
    total_price << selection.values[0]
  end

  def total_order
    total_price.inject { |sum, x| sum + x }
  end
end