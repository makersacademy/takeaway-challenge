require_relative 'menu'
require_relative 'confirm'

class Order

  def initialize
    @dish_list = Menu.new.dishes
  end

  def select(order)
    fail "Bad order! Check your maths." if !correct?(order)
    Confirm.new.send_text
    p "Good job! Order success."
  end

  private

  def correct?(order)
    sum = order[-1]
    order_hash = order[0]
    total = order_hash.keys.inject(0) do |cost, key|
      cost + order_hash[key] * @dish_list[key]
    end
    sum == total ? true : false
  end

end
