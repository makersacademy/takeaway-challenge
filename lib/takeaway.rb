class Takeaway
  attr_reader :order

  def initialize
    @menu = {"Salmon roll" => 5,
             "Tuna roll" => 6,
             "Crab roll" => 7}
    @order = []
  end

  def select(dish,price)
    @order << {dish => price}
  end

  def display_menu
    puts "Sushi Takeaway Menu"
    @menu.each do |dish, price|
      puts "#{dish.ljust(15)}£#{price.to_s}"
    end
  end

end
