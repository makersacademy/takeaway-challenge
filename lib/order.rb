class Order

  attr_reader :basket, :total

  def initialize
    @basket = Hash.new(0)
    @total = 0
  end

  def add_to_basket(item, quantity)
    @basket[item] = quantity     
  end

  def order_summary
    @basket.map { |item, quantity| "x#{quantity} #{item}(£#{sprintf("%.2f", Menu::MENU_ITEMS[item])}) = £#{sprintf("%.2f", Menu::MENU_ITEMS[item] * quantity)}"}.join(", ")
  end

  def order_cost
    @basket.each { |item, quantity| @total += Menu::MENU_ITEMS[item] * quantity }
    "Basket Total: £#{sprintf('%.2f', @total)}"
  end

  def empty_basket
    @basket = {}
    "All items removed from basket."
  end
end
