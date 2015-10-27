class Order
  attr_reader :basket, :check, :all

  def initialize
    @basket = Hash.new(0)
  end

  def add_basket(item, num)
    basket[item] += num
  end

  def basket_summary(menu)
    @all = menu.dishes[item]*num
    basket.map { |item,num| "#{item} x#{num} = £#{@all}" }.join(', ')
  end

  def bill(menu)
    @check = basket.map { |item, num| @all }.inject(:+)
    "Total: £#{@total}"
  end
end