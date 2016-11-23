class Order

  attr_reader :phone_number, :order

  def initialize( phone_number, *order )
    @phone_number = phone_number
    @order = order
  end

end
