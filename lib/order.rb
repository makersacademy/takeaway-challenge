
class Order
  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_dish(dish, price)
    @basket << { dish => price }
  end

  def total
    order_total = 0

    @basket.each do |item|
      order_total += item.values[0]
    end

    order_total
  end

  def show_basket
    return "Empty basket" if @basket.empty?

    formatted_basket = ""

    @basket.each do |item|
      name = item.keys[0]
      price = item[name]

      formatted_basket += "'#{name} $#{format("%.2f", price)}', "
    end

    "Your order is: #{formatted_basket}total is: $#{format("%.2f", total)}"
  end

end
