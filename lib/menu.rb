class Menu
  attr_reader :dishes, :order

  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @dishes = []
    @order = []
  end

  def add(dish_name, price)
    @dishes << @dish_class.new(dish_name, price)
  end

  def print_list
    @dishes.each_with_index { |dish, i|
      puts "#{i+1}. #{dish.name} - £#{dish.price}"
    }
  end

  def choose(num_list)
    num_list.split(',').each { |num|
      @order << @dishes[num.to_i-1]
    }
  end

  def clear
    @order = nil
  end

  def total
    @order.map { |item|
      item.price.to_f
    }.reduce(:+)
  end
end
