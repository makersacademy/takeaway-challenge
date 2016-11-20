class Order

  attr_reader :meal, :payment

  def initialize(meal)
    @meal = meal[0]
    @payment = meal[1]
  end



end
