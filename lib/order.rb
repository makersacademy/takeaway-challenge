class Order
  attr_reader :dish, :price, :order, :quantity

  def initialize()
    @order = []
    @price
    @dish
  end

  def add(dish, quantity = 1)
    @quantity = quantity
    @price = dish.price
    @order << {dish: dish.name ,price: dish.price, quantity: @quantity}
  end

  # def set_quantity
  #   puts "enter the desired quantity: "
  #   @quantity = gets.chomp.to_i
  # end

end
