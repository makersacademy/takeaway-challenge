class Order_item
  attr_reader :description, :quantity, :unit_price

  def initialize(description, unit_price)
    @description = description
    @quantity = 0
    @unit_price = unit_price
  end

  def alter_quantity(amount)
    raise 'Cannot reduce below zero - no alteration made'  if
        amount < 0 && amount.abs > quantity
    @quantity += amount if amount > 0
    @quantity += amount if amount < 0 && amount.abs <= quantity
  end

  def value
    @quantity * @unit_price
  end

end
