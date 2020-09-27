require_relative 'takeaway'

class Order
  attr_reader :takeaway, :orderlist, :dish, :price, :menu

  def initialize(takeaway = Takeaway.new(menu))
    @takeaway = takeaway
    @orderlist = []
  end

  def add(dish, price)
    @orderlist << { dish: price }
  end

  def total
    total = @orderlist.inject(0) {|sum, hash| sum + hash[:dish]}
  end

end