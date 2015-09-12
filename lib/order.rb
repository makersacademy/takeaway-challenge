class Order
  include Menu

  attr_accessor :contents, :add_item

  def initialize
    @contents = []
  end

  def add_item(dish, quantity)
      @contents << dish
      @contents << quantity
  end

  def order_total(total_price)
    prices = []
    order = Hash[@contents.each_slice(2).to_a]
    order.each do |dish, quantity|
        prices << menu[dish]*quantity
    end
    if total_price == prices.inject(:+)
      return 'bill is correct'
    else
      fail 'incorrect bill'
    end
  end
end
