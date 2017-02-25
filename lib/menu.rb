class Menu

  attr_reader :menu

  def initialize
    @menu = [
      { :dish => "Olives and sun-dried tomatos", :price => 2 },
      { :dish => "Soup of the day", :price => 4.5 },
      { :dish => "Fried calamari with homemade dressing", :price => 6.8 },
      { :dish => "Oven baked goat cheese", :price => 7.5 },
      { :dish => "Mixed leaf sald", :price => 3.2 },
      { :dish => "Sliced fresh tomato with mozarella", :price => 7.5 },
      { :dish => "Margherita", :price => 6.9 },
      { :dish => "Rigatoni al pomodoro",:price => 7 },
      { :dish => "Risotto mare",:price => 12.50 },
      { :dish => "Homemade tiramisu",:price => 5 }
    ]
  end

  def show_menu
    puts "MENU".center(40)
    @menu.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:dish]}, £#{item[:price]}"
    end
  end

end
