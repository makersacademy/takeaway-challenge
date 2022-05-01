class Homepage

  def initialize
    @restaurant_menus = []
    @restaurants = []
  end

  def display_restaurants
    find_restaurants
    @restaurant_menus.each_with_index do |name, index|
      @restaurants << "#{index + 1}: #{name.chomp('_menu.csv')}"
    end
    @restaurants.join("\n")
  end

  private 
  
  def find_restaurants
   @restaurant_menus = Dir["*_menu.csv"]
  end
end