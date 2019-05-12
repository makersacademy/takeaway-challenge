
class Menu

  # attr_reader :dish_list

  DISH_LIST = {
    "dosa" => 5,
    "pizza" => 5,
    "biryani" => 10,
    "fried rice" => 4,
    "dim sum" => 8,
    "pad thai" => 10}

  def initialize
    @dish_list = DISH_LIST
  end

  def display_dish
    @dish_list.each do |dish, price|
      puts "#{dish} => £#{price}"
    end
  end

# def display_dish
#   @dish_list
# end

end
