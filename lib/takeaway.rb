class Takeaway
  attr_reader :order, :total

  def initialize
    @menu = {"Salmon roll" => 5,
             "Tuna roll" => 6,
             "Crab roll" => 7}
    @order = []
    @total = 0
  end

  def display_menu
    puts "Sushi Takeaway Menu"
    @menu.each { |dish, price| puts "#{dish.ljust(15)}£#{price.to_s}" }
  end

  def select(dish,quantity)
    @order << {dish => quantity}
    @total += @menu[dish] * quantity
  end

  def check_total
    puts "Your order:"
    @order.each do |dish_ordered|
      dish_ordered.each do |dish, quantity|
        puts "#{dish.ljust(12)}x #{quantity.to_s.ljust(5)}£#{@menu[dish]*quantity}"
      end
    end
    puts "#{("Total").ljust(19)}£#{@total}"
  end

end
