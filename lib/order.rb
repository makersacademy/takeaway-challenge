class Order
  attr_reader :order
  
  def initialize
    @order = []
    @total = []
  end 

  def add(dish, price, quantity) 
    @order << { :dish => dish, :price => price, :quantity => quantity }
  end 

  def view
    @order.each { |dish, price, quantity| p "#{dish}, #{price}, #{quantity}" }
  end

  def total
    @order.map { |hash| @total << hash[:price] }
    return @total.sum
  end
end
