class Menu

  attr_reader :dish_list, :dish_list_with_prices

  def initialize
    @dish_list_with_prices = {'Egg Fried Rice' => '3', 'Prawn Crackers' => '2', 'Sweet and Sour Chicken' => '5'}
  end

  def print_menu
    @temp = []
    @dish_list_with_prices.each do |k, v|
      @food_name = "#{k}"
      @temp << @food_name
    end
    @temp.join(', ')
  end

  def print_menu_with_prices
    @temp = []
    @dish_list_with_prices.each do |k, v|
      @description = "#{k}: £#{v}"
      @temp << @description
    end
    @temp.join(", ")
  end

end
