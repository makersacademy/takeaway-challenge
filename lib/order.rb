class Order
  attr_reader :dishes_ordered

  def initialize
    @dishes_ordered = []
  end

  def add(dish)
    @dishes_ordered << dish
  end

  def basket_summary
    "Basket:\n#{basket}\nTotal: £#{"%.2f" % total}"
  end

  private

  def basket
    dishes = ""
    @dishes_ordered.each do |dish|
      dishes += "#{dish.name} - #{"%.2f" % dish.price}\n"
    end
    dishes
  end

  def total
    @dishes_ordered.inject(0) { |sum, dish| sum + dish.price }
  end
end
