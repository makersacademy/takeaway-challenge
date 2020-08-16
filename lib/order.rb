class Order

  def initialize
    @order = []
  end

  attr_reader :order

  def view
    @order.each { |hash| puts "#{hash[:quantity]}x #{hash[:item]}....£#{hash[:price]} each" }
  end

  def add(item, quantity, price)
    @order << { :item => item, :quantity => quantity, :price => price }
  end

  def total
    total = 0
    @order.each do |hash|
      total += (hash[:price] * hash[:quantity])
    end
    return total.round(2)
  end

end
