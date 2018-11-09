class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add_to_order(dish, quantity)
    @items << { :dish => dish, :quantity => quantity }
  end

  def total
    sum = 0
    @items.each { |item| sum += (item[:dish].price * item[:quantity]) }
    sum.round(2)
  end
end
