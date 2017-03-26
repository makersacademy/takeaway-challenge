require_relative 'menu'
require_relative 'order'
require 'twilio-ruby'

class Takeout

  attr_reader :menu, :my_order

  def initialize
    @menu = Menu.new('menu.csv')
    @my_order = Order.new
  end

  def order(key)
    dish = menu.dishes[key]
    my_order.add_dish(dish)
    # self.total += dish.price
  end

  def total
    my_order.total
  end

  def list_of_dishes
    my_order.dishes
  end

  def pay(sum)
    raise 'Wrong amount.' if sum.to_f != my_order.total
    account_sid = 'AC0c20791b57048ba5c24cfa1d05a52a59'
    auth_token = 'd7b307c5d1866ecf46228e35a13cc527'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(
      from: '+441202237841',
      to: '+447717022447',
      body: 'Payment successful.  Your order should be with you soon.'
    )
  end

  private

  attr_writer :total

end
