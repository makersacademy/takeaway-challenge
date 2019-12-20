class Order

attr_accessor :ordered_dishes

  def initialize
    @ordered_dishes = { }
  end

  def total

  end

  def add_item(dish, quantity = 1)
    added_item = {dish => @menu[dish]} #trying to access the hash in another class but not much luck with it. 
    quantity.times{@ordered_dishes.push(added_item)}
  end
end
