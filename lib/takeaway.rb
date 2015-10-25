require 'twilio-ruby'        # => true
require_relative 'send_text'  # => true

MENU = {'hamburger' => 1, 'chips' => 1.50}  # => {"hamburger"=>1, "chips"=>1.5}

class Takeaway
  include SendText            # => Takeaway
  attr_reader :menu, :basket  # => nil

  def initialize(menu = MENU)
    @menu = menu               # => {"hamburger"=>1, "chips"=>1.5}
    @basket = []               # => []
  end

  def show_menu
    items = menu.map { |item, price| "#{item.capitalize}: £#{price}"}  # => ["Hamburger: £1", "Chips: £1.5"]
    "Menu\n\n#{items.join("\n")}"                                      # => "Menu\n\nHamburger: £1\nChips: £1.5"
  end

  def order(item, qty = 1)
    basket << [item.downcase, qty]             # => [["hamburger", 4]], [["hamburger", 4], ["hamburger", 5]], [["hamburger", 4], ["hamburger", 5], ["chips", 3]]
    "#{qty}x #{item}(s) added to your basket"  # => "4x Hamburger(s) added to your basket", "5x Hamburger(s) added to your basket", "3x Chips(s) added to your basket"
  end

  def complete_order(price)
    fail 'Wrong total' unless calculate_price == price
    send_text "Thank you for your order: £#{price}"
  end

  def basket_summary
    basket.map { |item, qty| "#{qty}x #{item}(s): £#{qty * menu[item]}"}.join("\n")  # => "4x hamburger(s): £4\n5x hamburger(s): £5\n3x chips(s): £4.5"
  end

  def total
    "Total price: £#{calculate_price}"
  end

private                                                     # => Takeaway
  def calculate_price
    basket.map { |item, qty| qty * menu[item] }.inject(:+)
  end

  def wrong_total?(order, total)
    calculate_total(order) != total
  end
end


t = Takeaway.new        # => #<Takeaway:0x007ff6ec05f600 @menu={"hamburger"=>1, "chips"=>1.5}, @basket=[]>
t.show_menu             # => "Menu\n\nHamburger: £1\nChips: £1.5"
t.order 'Hamburger', 4  # => "4x Hamburger(s) added to your basket"
t.order 'Hamburger', 5  # => "5x Hamburger(s) added to your basket"
t.order 'Chips', 3      # => "3x Chips(s) added to your basket"
t.basket_summary        # => "4x hamburger(s): £4\n5x hamburger(s): £5\n3x chips(s): £4.5"
# t.calculate_total(t.basket)
# t.order(order: {"Hamburger" => 10}, total: 6)
# t.basket_summary
