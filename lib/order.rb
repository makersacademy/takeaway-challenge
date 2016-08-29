class Order

attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def add_dish(quantity, dish)
    basket[dish] += quantity
  end

  def summary
    basket.each do |dish, quantity|
      puts "#{dish} x #{quantity} = £#{menu.dishes[dish]*quantity}"
    end
    puts "Total = £#{total}"
  end

  def total
    basket.inject(0) do |sum, (dish, quantity)|
      sum + menu.dishes[dish]*quantity
    end
  end

  def empty?
    basket.count == 0
  end

  private

  attr_reader :menu

end
