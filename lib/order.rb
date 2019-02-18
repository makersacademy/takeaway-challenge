class Order
  attr_reader :order_string

  def initialize(order_string)
    @order_string = order_string
  end

  def check_order
    order_split = order_splitting(self.order_string)
    order_numbers = order_number_array(order_split)
    raise "Sum of dishes is not correct" if order_numbers[0..(order_numbers.length-2)].sum != order_numbers.last
  end

  private

  def order_splitting(order_string)
    order_string.split(",")
  end

  def order_number_array(order_array)
    ar = []
    i=0
    while i <= order_array.length
      ar.push(order_array[i].to_i)if i%2 == 0
      i += 1
    end
    return ar
  end

end
