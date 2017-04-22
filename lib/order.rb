
class Order

  attr_accessor :orders

  def initialize(menu)
    @menu = menu
    @orders = {}
  end

  def add_to_order(choice,quantity = 1)
     raise "Invalid Choice: Please pick a food on the menu" if @menu.available_dishes(choice) == false

     self.orders[choice] = quantity
     #@orders << @menu.dishes.list.any?{|item| return item if item.include?(choice)}
  end
end
