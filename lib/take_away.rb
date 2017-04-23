require_relative 'take_away'

class Takeaway
  attr_accessor :menu, :basket, :order_sum, :sub_total

  def initialize(basket = [])
    @basket = basket
    @sub_total = 0
  end

  def menu
    @menu = {1 => {:item => "Plain noodle", :price => 3},
             2 => {:item => "Egg fried rice", :price => 3},
             3 => {:item => "Special fried rice", :price => 5},
             4 => {:item => "Special chow mein", :price => 5},
             5 => {:item => "Sweet & sour chicken", :price => 5},
             6 => {:item => "Crispy beef", :price => 5}}
  end

  def order(*order)
    "Basket: #{@basket += order}"
  end

  def order_summary
    @order_sum = menu.values_at(*basket).compact
    items = @order_sum.map{|x| x[:item]}
    b = Hash.new(0)
    items.each{ |v| b[v] += 1}
    food_total = @order_sum.map{|x| x[:price]}
    @sub_total = food_total.sum
    b.each{ |k, v| }
  end

  def total
    food_total = @order_sum.map{|x| x[:price]}
    total = food_total.sum
    raise ArgumentError, "Total incorrect" if total != @sub_total
    "Thank you! Your order was placed and will be delivered before 18:52"
  end
end
