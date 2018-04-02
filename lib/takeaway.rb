require_relative 'menu'
require_relative 'basket'
require 'dotenv/load'
require 'twilio-ruby'

class Takeaway
  attr_reader :menu, :basket, :text_messager
  def initialize(menu = Menu.new, basket = Basket.new)
    @menu = menu
    @basket = basket
  end

  def view_menu
    menu.readable_menu
  end

  def add_item(item, quantity = 1)
    raise "Sorry, that is not available on the menu" unless menu.item_on_menu?(item)
    basket.add_to_basket(item, quantity)
    "#{quantity} x #{item} pizza(s) added to your basket"
  end

  def remove_item(item, quantity = 1)
    basket.remove_from_basket(item, quantity)
    "#{quantity} x #{item} pizza(s) removed from your basket"
  end

  def view_basket
    basket.display_order(menu)
  end

  def total_bill
    @total = basket.order_total(menu) unless basket_empty?
    "Your total bill is £#{'%.2f' % @total}."
  end

  def checkout(amount_paid)
    raise "Incorrect amount paid" unless correct_amount_paid?(amount_paid)
    send_text
  end


private

  def basket_empty?
    basket.my_order.empty?
  end

  def correct_amount_paid?(amount_paid)
    amount_paid == @total
  end

  def send_text
    time = (Time.now + (60*60)).strftime('%H:%M')
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      .messages.create(
        from: ENV['TWILIO_PHONE'],
        to: ENV['TWILIO_DESTIN'],
        body: "Thank you! Your order was placed and will be delivered before #{time}"
      )
    end

end
