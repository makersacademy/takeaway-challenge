class Order
  attr_accessor :dish, :combined_order
  attr_reader :quantity

  def initialize(dish, quantity)
    @dish = dish
    @quantity = quantity
    @combined_order = {}
  end

  def add_to_order
    clean_order
    @combined_order[:dish_1] = @dish_add
    @combined_order[:price_1] = @price_add.to_i
    @combined_order[:quantity_1] =  @quantity.to_i
  end

  private

  def clean_order
    @dish.slice!(0,3)
    @dish = @dish.split(",")
    @dish_add = @dish[0]
    @price_add = @dish[1]
  end
end