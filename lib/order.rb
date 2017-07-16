class Order

  attr_reader :total

  def initialize(menu_class = Menu)
    @menu = menu_class.new
    @basket = {}
    @total = 0
  end

  def add(dish, quantity)
    return "dish not found" unless menu.include?(dish)
    @basket[dish] = 0 unless basket[dish]
    @basket[dish] += quantity
    @total += menu.dishes[dish] * quantity
    "#{dish} x#{quantity} added to order"
  end

  def to_s
    raise "Basket is empty" if basket.empty?
    basket.map do |dish, quantity|
      "#{dish} x#{quantity} = £#{menu.dishes[dish] * quantity}"
    end.join("\n") + "\nTotal = £#{total}"
  end

  def size
    basket.size
  end

  private

  attr_reader :basket, :menu

end
