class Order
  attr_reader :mobile_number, :total, :order

  def initialize(mobile_number)
    @order = []
    @total = 0
    @mobile_number = mobile_number
    @submitted = false
  end

  def add(dish)
    update_total(dish)
    @order << dish
  end

  def check_total
    return :empty unless order.length.positive?

    checked_total = 0
    order.each { |dish| checked_total += dish.cost }
    return :correct if total == checked_total

    :incorrect
  end

  private 

  def update_total(dish)
    @total += dish.cost
  end
end
