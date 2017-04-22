# understands completion of order

class Checkout
  attr_reader :summarised_order, :final_summary

  def initialize(basket)
    line = '-------------------------'
    @final_summary = [line, 'Your Order:', line]
    order_print(summarise_order(basket))
    @final_summary << [line, "Total: £#{'%.2f' % basket.total_cost}", line]
  end

  def summarise_order(basket)
    @summarised_order = Hash.new 0
    order = basket.current_order
    order.each_with_object(@summarised_order) { |food, counts| counts[food] += 1 }
  end

  def order_print(order)
    order.each_with_index do |item, index|
      make_order_string(item, index)
    end
  end

  def make_order_string(item)
    food = item[0].keys.join
    price = item[0].values.join
    count = item[1]
    @final_summary << "#{count}x #{food} (£#{'%.2f' % price})"
  end

end
