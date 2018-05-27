require_relative 'restaurant_app'

class Menu
  attr_reader :list_of_dishes

  HEADER = "THIS IS OUR MENU:"
  FOOTER = "AVAILABLE FROM 12pm TO 10pm"

  def initialize(restaurant_app = RestaurantApp.new)
    @restaurant_app = restaurant_app
    @list_of_dishes = [
      { "margherita" => 6.30 },
      { "marinara" => 5.50 },
      { "romana" => 7.40 },
      { "prosciuto" => 9.20 },
      { "chorizo" => 9.10 },
      { "carciofi" => 8.90 }
      ]
    @dish = "Margherita"
  end

  def print_menu
    puts HEADER
    @list_of_dishes.each do |dish_and_price|
      puts "#{dish_and_price}"
    end
    # puts FOOTER
  end

  def select_food
    @restaurant_app.add_dish("Margherita")
  end
end
