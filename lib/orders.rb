require './lib/dishes'
require './lib/bill'
require './lib/send-sms'

class Orders
  include Dishes

  attr_reader :current

  def initialize(bill = Bill.new, sms = SMS.new)
    @sms = sms
    @current = []
    @bill = bill
  end

  def view_menu
    list 
  end

  def choose_dish(dish, quantity)
    fail "Dish not recognised: choose another" unless dish_exists?(dish)
    @current << [dish, quantity, Dishes::MENU[dish]]
  end

  def view_order
    @bill.create(current)
  end

  def buy 
    @sms.send_sms
  end

  private 

  def dish_exists?(dish)
    Dishes::MENU.include?(dish)
  end

end
