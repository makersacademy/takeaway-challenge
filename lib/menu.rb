class Menu

  attr_reader :list, :order, :total, :dish_selection, :quantity

  def initialize
    @list = {"Chicken"=>5, "Fish"=>7, "Lamb"=>6, "Vegan"=>5}
    @order = []
    @total = 0
  end

  def see
    @list.each do |dish, price|
      puts "#{dish}: #{price}"
    end
  end
  #
  def choose(dish_selection, quantity)
    @dish_selection = dish_selection
    @quantity = quantity
    @order << { dish_selection: dish_selection, quantity: quantity }
    calculate
  end

  private
  
  def calculate
    @total += @list[dish_selection] * quantity
  end
end
