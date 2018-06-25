class Menu
  attr_reader :dishes

  def initialize(dishes = { Dosa: 7.95, Chapatti: 2.70 })
    @dishes = dishes
  end

  def show
    dishes.map do |title, price|
      "#{title} - £#{'%.2f' % price}"
    end.join(', ')
  end

  def includes_dish?(dish)
    dishes.include?(dish.to_sym)
  end

  def price(dish)
    dishes[dish.to_sym]
  end
end
