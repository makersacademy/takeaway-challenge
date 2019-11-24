class Takeaway
  attr_reader :menu, :basket, :text_provider

  def initialize(menu = Menu.new, text_provider = TextProvider.new)
    @basket = {}
    @menu = menu
    @text_provider = text_provider
  end

  def read_menu
    @menu.list
  end

  def order(dish, quantity = 1)
    @basket[dish] = quantity
    "#{quantity}x #{dish.name}(s) added to your basket."
  end

  def basket_summary
    @basket.map { |dish, quantity| "#{dish.name} x#{quantity} = £#{dish.price * quantity}" }.join(", ")
  end

  def total
    "Total: £#{calculate_total}"
  end

  private

  def calculate_total
    @basket.reduce(0) { |total, (dish, quantity)| total + dish.price * quantity }
  end
end
