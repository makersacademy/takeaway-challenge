class Order

  attr_reader :cart, :total, :status

  def initialize
    @cart = Hash.new { |hash, key| hash[key] = 0 }
    @total = 0
    @status = :new
  end

  def add(dish, quantity)
    @cart[dish] += quantity
    @total += dish.price * quantity
  end

  def canceled
    @status = :canceled
  end

  def payed
    @status = :payed
  end
end
