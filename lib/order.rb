class Order

  def initialize
    @order = []
  end

  attr_reader :order

  def view
    @order.each { |hash| puts "#{hash[:quantity]}x #{hash[:item]}....#{hash[:price]}" }
  end

  def add(item, quantity, price)
    @order << { :item => item, :quantity => quantity, :price => "£#{price} each" }
  end

end
