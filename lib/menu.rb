class Menu

  attr_reader :list, :order

  def initialize
    @list = {"Chicken"=>5, "Fish"=>7, "Lamb"=>6, "Vegan"=>5}
    @order = []
  end

  def see
    @list.each do |dish, price|
      puts "#{dish}: #{price}"
    end
  end
  #
  def choose(*dish_selection)
    dish_selection.each do |dish|
        @order << dish
    end
  end

end
