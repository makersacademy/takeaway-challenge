class Order
  attr_reader :order
  
  def initialize
    @order = []
    @total = []
    @total_dishes = []
  end 

  def add(dish, price, quantity) 
    @order << { :dish => dish, :price => price, :quantity => quantity }
  end 

  def view
    @order.each { |dish, price, quantity| p "#{dish}, #{price}, #{quantity}" }
  end

  def total_cost
    @order.map { |hash| @total << hash[:price] }
    return @total.sum
  end

  def dish_count
    @order.map { |hash| @total_dishes << hash[:quantity] }
    return @total_dishes.sum
  end
end
