class Takeaway
  attr_reader :menu, :basket, :text_provider

  def initialize(menu = Menu.new, text_provider = TextProvider.new)
    @basket = Hash.new(0)
    @menu = menu
    @text_provider = text_provider
  end

  def read_menu
    @menu.list
  end

  def order(dish, quantity = 1)
    fail "This dish is not in the menu" unless @menu.include?(dish)

    @basket[dish] += quantity
    "#{quantity}x #{dish.name}(s) added to your basket"
  end

  def basket_summary
    @basket.map do |dish, quantity|
      "#{dish.name} x#{quantity} = £#{dish.price * quantity}"
    end.join(", ")
  end

  def total
    "Total: £#{calculate_total}"
  end

  def correct_amount?(price)
    price == calculate_total
  end

  private

  def calculate_total
    @basket.reduce(0) { |total, (dish, quantity)| total + dish.price * quantity }
  end
end
