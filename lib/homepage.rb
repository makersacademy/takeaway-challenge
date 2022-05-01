class Homepage

  attr_reader :currently_viewed_menu

  def initialize
    @restaurant_menus = []
    @restaurants = []
    @currently_viewed_menu = nil
  end

  def display_restaurants
    find_restaurants
    @restaurant_menus.each_with_index do |name, index|
      @restaurants << "#{index + 1}: #{name.chomp('_menu.csv').gsub("./lib/", "")}"
    end
    @restaurants.join("\n")
  end

  def see_restaurant_menu(name)
    @currently_viewed_menu = Menu.new(name)
    @currently_viewed_menu.read_menu
  end

  private 
  
  def find_restaurants
   @restaurant_menus = Dir["./lib/*_menu.csv"]
  end
end


homepage = Homepage.new
puts homepage.display_restaurants
