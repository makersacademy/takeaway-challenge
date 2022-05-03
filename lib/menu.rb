class Menu

  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output
    @dishes = [{ food: :Chips, price: 1 }, 
      { food: :Tofu, price: 2 }, { food: :Broccoli, price: 1 }, 
      { food: :Ice_cream, price: 2 }]
  end

  def show
    @dishes.each_with_index do |item, index| 
      @output.puts "#{index + 1}. #{item[:food]} - £#{item[:price]}"
    end
  end

  def check(dish)
    the_dish = dish.to_sym
    @dishes.each do |dish|
      if the_dish == dish[:food]
        return true
      end
    end
    return false
  end

  def price(dish)
    the_dish = dish.to_sym
    @dishes.each do |dish|
      if the_dish == dish[:food]
        return dish[:price]
      end
    end
    return false
  end

end
