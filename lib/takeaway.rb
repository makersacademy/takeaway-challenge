class Takeaway

  attr_reader :menu

  def initialize
    @menu = {:pizza => {"Margherita" => 8.95, "Hawaiian" => 9.95, "Vegetarian" => 9.95, "Pepperoni" => 10.95, "BBQ Chicken" => 10.95},
    :drinks => {"Coke" => 1.95, "Diet Coke" => 1.85, "Water" => 1.00}}
    puts "Welcome! Here is the menu. To order, type takeaway.order."
    puts @menu
  end

end
