require 'pry'
class Menu

attr_reader :order

  def initialize(dish_class=Dish)
    @dish_class = dish_class
    @dishes = Hash.new
    @order = Hash.new

  end

  def create_dish(name, price)
    @dishes[name] = @dish_class.new(name, price)
  end

  def see_dishes
    raise 'there are no dishes' if @dishes.empty?
    @dishes.each_value do |dish| 
      dish.name
      dish.price
    end
  end

  def place_order(name, quantity)
    @order[@dishes[name]] = quantity
    subtotal
  end


  def subtotal
    @sum = 0
    order.each_pair do |dish, quantity|
      @sum += (dish.price)*quantity
    end
    @sum
  end

  
end