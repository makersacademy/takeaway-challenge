class Takeaway
  def initialize(menu)
    @menu = menu
    @basket = {}
    @total = 0
  end

  attr_reader :basket, :total

  def menu
    @menu.dishes
  end

  def order(dish, number=1)
    @basket[ordered(dish,number)] = price(dish,number)
    @total += price(dish,number)
  end

  def basket_sum
    sum = 0
    @basket.each do |key, value|
      sum += value
    end
    sum
  end

  private

  def ordered(dish, number)
    "#{dish} x#{number}"
  end

  def price(dish, number)
    @menu.price(dish) * number
  end


  #Have menu be a different class - the takeaway deals with orders, it doesn't also save the dishes and prices.
end