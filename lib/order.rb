class Order

  attr_accessor :customer_name, :customer_number, :items

  def initialize(customer_name, number)
    @customer_name = customer_name
    @customer_number = number
    @items = {}
  end

  def get_number(number)
    @customer_number = number
  end

  def add_item(item, quantity)
    @items[item] = quantity
  end

end