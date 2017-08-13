DISHES = {
pizza: 5,
curry: 5.50,
fries: 2,
chicken: 7.50,
kebab: 6.5
}

class Menu

  attr_reader :dishes, :order

  def print_dishes
    DISHES.each do |dish, amount|
      puts "#{dish}: £#{amount}"
    end
  end

end
