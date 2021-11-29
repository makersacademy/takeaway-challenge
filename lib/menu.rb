class Menu 
  attr_reader :dishes

  def initialize
    @dishes = [{ "Fried Chicken": 8 }, { Chips: 3 }]
  end

  def show
    @dishes.each do |dish|
      dish.each { |name, price| puts "#{dishes.index(dish) + 1}. #{name} - £#{price}" }
    end
  end

  def add_to_order(order, item_number)
    order.items << dishes[item_number - 1]
  end
end
