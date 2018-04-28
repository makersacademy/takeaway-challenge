class Meal
  attr_reader :basket, :menu

  def initialize(menu)
    @basket = []
    @menu = menu
  end

  def add_dish(selection, quantity)
    @menu.menu.each do |dish|
      quantity.times { @basket << dish if dish[:name] == selection }
    end
  end

  def sum_of_basket
    @basket.map { |dish| dish[:price] }.inject(:+)
  end

end
