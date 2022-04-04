require_relative './takeaway'

class Order

  attr_reader :list

  def initialize(available_dishes)
    @list = []
    @available_dishes = available_dishes
  end

  def add_to_order(choice, quantity = 1)
    @available_dishes.each { |dish| @list << dish if dish.include?(choice.to_sym) }
    "#{choice.capitalize} was added to your order."
  end

  def total
    @total = 0
    @list.each do
      |dish| @total += dish.values[0][-1].to_i
    end
    "Total for order is: £#{@total}."
  end

end
