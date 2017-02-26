class Dishes
  attr_reader :dishes, :print_dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_dishes
    @dishes.map do |item, price|
        "#{item}: £#{'%.2f' % price}"
    end
  end

  private

  def add_dish(item, price)
    @dishes[item] = price
  end
end
