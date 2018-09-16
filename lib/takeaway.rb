class Takeaway

  attr_reader :basket, :menu, :total

  def initialize
    @menu = {
      :Margherita => 4.99,
      :Pepperoni => 6.99,
      :"Four Cheese" => 5.99,
      :Sausage => 6.99,
    }
    @basket = {} # item name and quantity
    @sum_total = 0
  end

  def order(food, amount = 1)
    raise "We do not sell that item" if !@menu.has_key?(food.to_sym)
    @basket[food.to_sym] = amount
  end

  def total
    @basket.map { |k, v| @sum_total += @menu[k] * v }
      "£#{@sum_total}"
  end

  def itemsandprice
    @basket.map { |k, v|
      "#{v}x #{k}: £#{@menu[k] * v}"
    }.join(", ")
  end

end
