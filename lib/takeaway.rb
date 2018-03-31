class Takeaway
  attr_reader :my_order
  def initialize
    @my_order = Hash.new(0)
  end

  def view_menu
    {"Margharita"=> 7.00, "Pepperoni"=> 7.50, "Ham & Pineapple"=> 7.50, "Vegetarian"=> 7.00, "Meat Feast"=> 8.00}
  end

  def add_item(item, quantity = 1)
    raise "Sorry, that is not available on the menu" unless view_menu.include?(item)
    @my_order[item] += quantity
  end

  def remove_item(item, quantity = 1)
    raise "Sorry, you can't remove more than you've ordered" if my_order[item] < quantity
    @my_order[item] -= quantity
  end


end
