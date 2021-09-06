class Restaurant
  attr_reader :order

  def initialize
    @menu = {
      "Fries" => 2,
      "Milkshake" => 4
    }

    @order = []
  end
  
  def display_menu
    @menu.each do |meal, price|
      puts "#{meal} - £#{price}"
    end
  end

  def add_meal(meal, quantity=1)
    @order.push([meal, quantity])
  end

end