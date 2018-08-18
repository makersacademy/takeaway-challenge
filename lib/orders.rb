require './lib/dishes'
require './lib/bill'

class Orders
  include Dishes

  attr_reader :current

  def initialize(bill = Bill.new)
    @current = []
    @bill = bill
  end

  def view_menu
    list 
  end

  def choose_dish(dish, quantity)
    @current << [dish, quantity, Dishes::MENU[dish]]
  end

  def view_order
    @bill.create(current)
  end

end
