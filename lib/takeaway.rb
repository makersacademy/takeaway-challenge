# a Takeaway in your neighbourhood
class Takeaway
  attr_reader :order, :dishes

  def initialize
    @dishes = [
      { name: :rice, price: 3 }, 
      { name: :noodles, price: 3.5 }, 
      { name: :prawn_crackers, price: 1 }, 
      { name: :spring_rolls, price: 2.5 }
    ]
  end

  def new_order(order = Order.new)
    @order = order
  end

  def place_order
    @order.place
  end

  def menu
    these_dishes = []
    @dishes.each do |dish|
      these_dishes << dish
    end
    these_dishes
  end

  def add_to_order(dish)
    @order.add_dish(dish)
  end

end
