class Takeaway

  attr_reader :orders

  def initialize menu
    @menu = menu
    @orders = Hash.new
  end

  def order dish
    orders[dish] = @menu.content[dish]
  end

  def receipt
    orders.each { |dish,price| puts dish.ljust(20) + price.to_s.rjust(2)}
    puts "-" * 22
    total = (orders.values).inject { |sum, n| sum + n}
    p total
  end

end
