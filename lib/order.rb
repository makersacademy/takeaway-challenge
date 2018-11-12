class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = Hash.new
    @menu = menu.dishes
  end

  def add_to_order(item, quantity)
    @menu.each do |dish, price|
      @basket[dish] = price * quantity if item == dish
    end
    raise "Sorry, your selection is unavailable" unless @menu[item]
  end

  def total_order
    @basket.map { |dish, price| price }.reduce(:+)
  end



end
