require_relative 'take_away'

class Takeaway
  attr_accessor :menu, :basket, :order_sum

  def initialize(basket = [])
    @basket = basket
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
    @basket += order
  end

  def order_summary
    @order_sum = menu.values_at(*basket).compact
  end

  def order_total
    total_price = @order_sum.map{|x| x[:price]}
    "Total to pay: £#{total_price.sum}"
  end
end
