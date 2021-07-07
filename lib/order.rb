require_relative 'takeaway'

class Order

  attr_reader :view_order

  def initialize(customer_order)

    @view_order = customer_order

  end
end
