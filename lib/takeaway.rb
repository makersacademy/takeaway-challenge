require_relative 'menu'
require_relative 'text'


class Takeaway

  attr_reader :total, :credentials

  def initialize(menu_klass = Menu, text_klass = Text)
    @menu = menu_klass.new
    @basket = Hash.new(0)
    @text = text_klass.new
  end

  def menu
    @menu.dishes.dup
  end

  def order(dish, quantity=1)
    fail 'Sorry, that item is not on the menu' if menu.has_key?(dish) == false
    @basket[dish] += quantity
  end

  def confirm_order(estimate)
    fail 'Total is not correct, please try again' if estimate != calculate_total
    @text.send_text(calculate_total)
    "Thanks for your order, it will be delivered by #{time.strftime("%H:%M")}"
  end

  def basket
    @basket["Total"] = "£#{calculate_total}"
    @basket
  end

  def calculate_total
    @total = 0
    @basket.each_pair { |dish, qty| @total += (qty * menu[dish]) }
    @total
  end

  private

  attr_reader :time

  def time
    @time = Time.new + 3600
  end

end
