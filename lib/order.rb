class Order
  attr_reader :contents

  def initialize
    @contents = []
  end

  def add(item, quantity = 1)
    if @contents.any? { |h| h[:item] == item }
      increase_order_quantity(item, quantity)
    else
      add_new_item(item, quantity)
    end
  end

  def increase_order_quantity(item, quantity)
    @contents[@contents.index { |h| h[:item] == item }][:quantity] += quantity
  end

  def add_new_item(item, quantity)
    new_addition = {
    :item => item,
    :quantity => quantity
    }
    @contents << new_addition
  end
end
