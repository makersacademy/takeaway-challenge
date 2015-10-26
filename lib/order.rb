class Order

  attr_reader :list

  def initialize
    @list = Array.new
  end

  def add(dish, quantity)
    @list << {dish: dish, quantity: quantity}
  end

  def total
    total = 0
    @list.each do |item|
      price, quantity = item[:dish].price, item[:quantity]
      total += price * quantity
    end
    return total
  end

  def receipt
    receipt = 'Your order: '
    @list.each_with_index do |item, index|
      na, qu, = item[:dish].name, item[:quantity]
      pr = item[:dish].price * qu
      receipt << "#{na} x#{qu} = £#{pr}"
      receipt << ", " if index < (@list.length - 1)
    end
    return receipt
  end


end
