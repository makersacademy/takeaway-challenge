class Order
  attr_reader :basket, :total_cost, :order

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total_cost = 0
  end

  def order(meal, quantity)
    raise "Oops! We don't stock that meal." if !@menu.menu_list[meal]

    price = quantity * @menu.menu_list[meal]

    @basket << ("#{meal} (#{quantity}): £#{price}")

    @total_cost += price
    "You added #{quantity} #{meal}s to your basket."
  end
end
