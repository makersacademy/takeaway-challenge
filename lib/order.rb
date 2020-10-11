class Order
  attr_reader :basket, :total_cost

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total_cost = 0
  end

  def order(meal, quantity)
    raise "Oops! We don't stock that meal." unless @menu.menu_list[meal]

    price = quantity * @menu.menu_list[meal]
    @basket << "#{meal} (#{quantity}): £#{price}"
    @total_cost += price
    "You added #{quantity} #{meal}s to your basket."
  end

  def pay(amount)
    raise "Incorrect amount specified" if @total_cost != amount

    puts "Order complete! Thank you for your purchase."
    @total_cost = 0
    @basket = []
  end
end
