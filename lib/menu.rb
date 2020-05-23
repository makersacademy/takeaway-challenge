class Menu

attr_reader :dishes

  def initialize
    @dishes = {"Large Fish Supper" => 7.90, "Small Fish Supper" => 5.50,  "White Sausage" => 2.30, "Mars Bar in Batter" => 2.00}
  end

  def print_menu
    formatted_dishes_list = []
    @dishes.each do |dish, price|
      formatted_dishes_list << "#{dish} - #{'%.2f' %price}"
    end
    formatted_dishes_list
  end
end
