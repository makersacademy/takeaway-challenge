class Restaurant
  def initialize
    @menu = {
      "Fries" => 2,
      "Milkshake" => 4
    }
  end
  
  def display_menu
    @menu.each do |meal, price|
      puts "#{meal} - £#{price}"
    end
  end
end