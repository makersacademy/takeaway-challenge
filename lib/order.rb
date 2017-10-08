class Order

attr_reader :name, :dish_list

  def initialize(name)
    @name = name
    @dish_list = []
  end

  def addto_order(dish)
    @dish_list <<  dish
  end

  def total
    dish_list.map {|hash|hash.values}.flatten.inject(:+)
  end

end
