class Order

  def initialize
    @order = []
  end

  attr_reader :order

  def view
    @order.each do |hash|
      puts "#{hash[:quantity]}x #{hash[:item]}....£#{hash[:price]} each"
    end
  end

  def add(item, quantity, price)
    @order << { :item => item, :quantity => 0, :price => price } unless already_in_order(item)
    update_quantity(item, quantity)
  end

  def total
    total = 0
    @order.each do |hash|
      total += (hash[:price] * hash[:quantity])
    end
    return total.round(2)
  end

  private
  def already_in_order(item)
    @order.each do |hash|
      return true if hash.value?(item)
    end
    false
  end

  def update_quantity(item, quantity)
    @order.each do |hash|
      hash[:quantity] += quantity if hash.value?(item)
    end
  end
end
