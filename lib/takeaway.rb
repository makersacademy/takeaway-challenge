require_relative 'menu'
require_relative 'basket'
class TakeAway

  attr_reader :menu, :basket, :total, :sms

  def initialize(menu = Menu.new, basket = Basket.new, sms = SMS.new(config),config: )
    @menu = menu
    @basket = basket
    @sms = sms
  end

  def gets_menu
    @menu.generator
  end

  def adds(list_number, value)
    dish = select(list_number)
    @basket.adding(dish, value)
  end

  def checks_out
    sms.deliver
    @basket.total
  end

  def order
    "Thank you! Your order was placed and will be delivered before 18:52"
  end

  private
  def select(list_number)
    @menu.list[list_number]
  end

end
