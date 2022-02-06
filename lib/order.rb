class Order
  attr_accessor :dishes, :combined_order

  def initialize(dishes)
    @dishes = dishes
    @combined_order = {}
  end

  def add_to_order
    (0...@dishes.length).each do | i |
      clean_order(i)
      @combined_order[:"dish_#{i}"] = @dish_add
      @combined_order[:"price_#{i}"] = @price_add.to_i
      @combined_order[:"quantity_#{i}"] = @quantity.to_i
    end
  end

  private

  def clean_order(number)
    @dishes[number].slice!(0,3)
    @dish = @dishes[number].split(",")
    @dish_add = @dish[0]
    @price_add = @dish[1]
    @quantity = @dish[2]
  end
end