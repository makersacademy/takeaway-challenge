require_relative 'twilio'

class Order

  def initialize(dishes:)
    @dishes = dishes
    # @bill = bill
  end

  def dishes
    @dishes.dup
  end

  def print_out
    @dishes.map { |dish, quantity| "#{quantity} x #{dish.name}" }.join("\n")
  end

  def bill
    (@dishes.map { |dish, quantity| dish.price * quantity }.reduce(:+)).round(2)
  end

  def confirm
    @confirmed = true
  end

  def confirmed?
    @confirmed ||= false
  end

end
