class Homepage

  attr_reader :currently_viewed_menu

  def initialize
    @restaurant_menus = []
    @restaurants = []
    @currently_viewed_menu = nil
    @order = nil
  end

  def display_restaurants
    return @restaurants.join("\n") unless @restaurants.empty?
    find_restaurants
    @restaurant_menus.each_with_index do |name, index|
      @restaurants << "#{index + 1}: #{name.chomp('_menu.csv').gsub("./lib/", "")}"
    end
    @restaurants.join("\n")
  end

  def see_restaurant_menu(restaurant)
    @currently_viewed_menu = Menu.new(restaurant)
    @currently_viewed_menu.read_menu
  end

  def create_order(restaurant)
    @order = Order.new(restaurant)
  end

  private 
  
  def find_restaurants
   @restaurant_menus = Dir["./lib/*_menu.csv"]
  end
end
