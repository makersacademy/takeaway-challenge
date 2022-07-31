require 'customer'

class Restaurant
  attr_accessor :menu_arr, :total

  def initialize
    @menu_arr = [
      {"pesto pasta" => 5,
      "ravioli" => 5,
      "pigeon" => 5,
      "arabic herbs" => 10,
      "mud pie" => 10}
  ]
  end

  def print_menu
    p "Here is a list of our dishes: "
    @menu_arr.each do |meal, price|
      p "Meal:#{meal}, Price:#{price}"
    end
  end

end
