require_relative 'Menu'
require_relative 'Calculator_module'

class Restaurant

  attr_reader :menu
  include Calculator

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def bill
    @order = menu.your_order
    calculate(@order)
  end

  def kitchen
    @order_accepted
  end

  def place_your_order
    fail 'Please select your meal' if @order == nil
    require_relative 'twilio.rb'
    @order_accepted = @order
  end

end
