require_relative "menu"

class Takeaway

  attr_reader :menu, :items, :total, :basket, :basket_summary

  def initialize
    menu = Menu.new
    @basket = Hash.new
    @basket_summary = basket_summary
  end

  def show_menu
    menu.items.each{ |i, p| puts"#{i.capitalize}.to_s - £#{p.to_s}" }
  end

  def add_order(name, quantity= 1)
    @basket = basket
    @basket_summary = []
    basket[name] = quantity, Menu::MENU[name]
  end

  def order_total
    basket.values.map{|i| i[0] * i[1]}.reduce(&:+).round(2)
  end

  def order_confirm
    fail "There is a problem with your order." if order_total != total
  end

  def order_complete
    "Thank you! Your order was placed and will be delivered before 18:52."
  end
end
