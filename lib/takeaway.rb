require_relative 'menu'
require_relative 'message'

class Takeaway

  def initialize(menu_class = Menu)
    @menu = menu_class.new
    @basket_items = []
    @total = 0
  end

  def menu
    @menu.show_menu
  end

  def order(item, number = 1)
    fail 'Item is not on menu' unless on_menu?(item)
    price = calculate_price(item, number)
    update_total(price)
    @basket_items << "#{number} x #{item} = £#{price}"
    "#{number} #{item}(s) added to your order"
  end

  def basket
    @basket_items.join(", ")
  end

  def total
    "Order total: £#{@total.round(2)}"
  end

  def total_to_pay
    @total
  end

  def checkout(amount, message_class = Message)
    fail "You have not paid the correct amount, please try again" unless payment_correct?(amount)
    message_class.new.send
  end

  private

  def on_menu?(item)
    @menu.show_menu.include?(item)
  end

  def calculate_price(item, number)
    (number * @menu.show_menu[item]).round(2)
  end

  def update_total(price)
    @total += price
  end

  def payment_correct?(amount)
    amount == @total
  end

end
