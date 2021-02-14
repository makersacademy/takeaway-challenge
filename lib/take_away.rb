require 'menu'
require 'basket'
require 'messenger'

class TakeAway
  attr_reader :basket
  def initialize(menu = Menu.new, messenger = Messenger.new, basket = Basket.new)
    @menu = menu
    @basket = basket
    @messenger = messenger
  end 

  def read_menu
    @menu.dishes
  end 

  def add_to_basket(dish, quantity = 1)
    fail "#{dish} is not available" unless dish_available?(dish)

    @basket.add(dish, quantity)
  end

  def checkout(payment)
    fail "Incorrect amount" unless correct_amount?(payment) 
    
    @messenger.send_order_notification
  end

  private 

  def correct_amount?(payment)
    @basket.total(@menu) == payment 
  end

  def dish_available?(dish)
    !@menu.dishes[dish].nil?
  end 

end 
