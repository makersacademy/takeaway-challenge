class Menu 
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def show
    @dishes.each do |dish|
      dish.each { |name, price| puts "#{dishes.index(dish) + 1}. #{name} - £#{price}" }
    end
  end

  def add_item(order, item_number)
    order.items << dishes[item_number - 1]
  end
end