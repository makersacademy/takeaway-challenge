require 'twilio-ruby'        # => true
require_relative 'send_sms'  # => true

MENU = {hamburger: 1, chips: 1.50}  # => {:hamburger=>1, :chips=>1.5}

class Takeaway
  include SendSms             # => Takeaway
  attr_reader :menu, :basket  # => nil

  def initialize(menu = MENU)
    @menu = menu               # => {:hamburger=>1, :chips=>1.5}
    @basket = []               # => []
  end

  def show_menu
    menu         # => {:hamburger=>1, :chips=>1.5}
  end

  def order(item, qty = 1)
    basket << [item, qty]                      # => [["Hamburger", 4]], [["Hamburger", 4], ["Hamburger", 5]], [["Hamburger", 4], ["Hamburger", 5], ["Chips", 3]]
    "#{qty}x #{item}(s) added to your basket"  # => "4x Hamburger(s) added to your basket", "5x Hamburger(s) added to your basket", "3x Chips(s) added to your basket"
  end

  def complete_order(price)
    fail 'Wrong total' unless calculate_price == price
    send_text "Thank you for your order: £#{price}"
  end

  def basket_summary
    basket            # => [["Hamburger", 4], ["Hamburger", 5], ["Chips", 3]]
  end

  def confirm_order(body)
    send_text(body)
  end

  def calculate_price
    basket.map { |item, qty| qty * menu[item] }.inject(:+)
  end

  def wrong_total?(order, total)
    calculate_total(order) != total
  end


end


t = Takeaway.new        # => #<Takeaway:0x007fde9125c098 @menu={:hamburger=>1, :chips=>1.5}, @basket=[]>
t.show_menu             # => {:hamburger=>1, :chips=>1.5}
t.order 'Hamburger', 4  # => "4x Hamburger(s) added to your basket"
t.order 'Hamburger', 5  # => "5x Hamburger(s) added to your basket"
t.order 'Chips', 3      # => "3x Chips(s) added to your basket"
t.basket_summary        # => [["Hamburger", 4], ["Hamburger", 5], ["Chips", 3]]
# t.calculate_total(t.basket)
# t.order(order: {"Hamburger" => 10}, total: 6)
# t.basket_summary
