class Order

  attr_reader :phone, :order

  def initialize( phone_number, *order )
    @phone = phone_number
    @order = order
  end

end
