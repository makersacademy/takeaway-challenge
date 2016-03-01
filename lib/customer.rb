class Customer

  attr_reader :name, :phone, :order

  def initialize(name,phone,order = nil)
    @name = name
    @phone = phone
    @order = order
  end

  def choose_takeawey(name)
    @takeaway = name
  end

  def make_order(some_order)
    @order = some_order
  end

  def add_to_order(dish, quantity = 1)
    @takeaway.order(@order,dish,quantity)
  end

  def remove_from_order(dish, quantity = 1)
    @takeaway.correct_order(@order,dish,quantity)
  end

  def checkout
    @takeaway.complete_order(order)
  end
end