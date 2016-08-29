#Understands the process of ordering a takeaway

require_relative 'menu'
require_relative 'sms'

class Takeaway

  attr_reader :menu, :total

  def initialize(menu = Menu.new, sms_class = Text)
    @menu = menu
    @basket = {}
    @total = 0
    @sms = sms_class
  end

  def get_menu
    @menu.print_menu
  end

  def select_food(food, amount)
    raise "This item is not on the menu" if @menu.included?(food) == false
    @basket[food] = amount
  end

  def checkout
    @basket.each do |food, price|
      @total += ((@menu.price_checker(food)) * price)
    end
    @total
  end

  def confirmation_text
    @sms.new.send_text
  end


end
