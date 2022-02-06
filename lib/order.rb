require_relative './takeaway'

class Order

  attr_reader :list

  def initialize(available_dishes)
    @list = []
    @available_dishes = available_dishes
    @total = 0
  end

  def add_to_order(choice)
    @available_dishes.each { |dish| @list << dish if dish.include?(choice.to_sym) }
  end

  def total
    @list.each do
      |dish| @total += dish.values[0][-1].to_i
    end
    "Total for order is: £#{@total}."
  end

end
