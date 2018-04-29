require_relative 'dish'

class Order
  def initialize
    @basket = {}
    @current_total = 0
  end

  def current_total
    (@current_total = total_calculation).round(2)
  end

  def basket
    @basket.dup
  end

  def add_to_basket(item, number)
    if in_basket?(item)
      @basket[item.name][1] += number
      return "Added #{number} more of #{item.name} to basket"
    else
      @basket[item.name] = [item.price, number]
      "Added #{number} of #{item.name} to basket"
    end
  end

  def print_order
    output = []
    @basket.each { |key, value| output << "#{key} - £#{value[0]} x#{value[1]}" }
    output << "Total: £#{current_total}"
    output.join("\n")
  end

  private

  def in_basket?(item)
    @basket.has_key? item.name
  end

  def total_calculation
    total = 0
    @basket.each_value { |value| total += value[0] * value[1] }
    total
  end
end
