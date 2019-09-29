class DigitalTill

  def initialize(order)
    @order = order
  end

  def verify_total(total)
    total == items_total
  end

  private

  def items_total
    @order.map { |item| item[:cost] }.sum
  end
end
