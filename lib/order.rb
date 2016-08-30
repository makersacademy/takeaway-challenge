require_relative 'menu'
require_relative 'confirm'

class Order

  def initialize
    @dish_list = Menu.new.dishes
  end

  def select(order)
    fail "Bad order! Check your maths." if !correct?(order)
    Confirm.new.send_text
    "Good job! Order success."
  end

  private

  def correct?(order)
    total = order_hash(order).keys.inject(0) do |cost, key|
      cost + order_hash(order)[key] * @dish_list[key]
    end
    sum(order) == total ? true : false
  end

  def sum(order)
    order[-1]
  end

  def order_hash(order)
    order[0]
  end

end
