class Order

attr_accessor :order_items, :order_name, :order_id

  def initialize(name = "patel")
    @order_name = name
    @order_items = []
  end

end
