require_relative 'order'
# IRB SCRIPT
# irb -r ./lib/takeaway.rb

class Takeaway
  attr_reader :dishes, :order

  DISHES = {
    pizza: 5,
    sausage: 3,
    chicken: 4,
    curry: 7,
    family_deal: 15
  }

  def initialize(order = Order.new)
    @dishes = DISHES
    @order = order
  end

  def select(dish, quantity)
    @order.add_to_order(dish, quantity)
  end

end


  # def view_dishes
  #   puts "Menu"
  #   puts ""
  #   puts "Dishes"
  #   @dishes.each { |k, v| puts "#{k} - #{v[0].to_s.capitalize} - £#{v[1]}" }
  #   puts ""
  # end
