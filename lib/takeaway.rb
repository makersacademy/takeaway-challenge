require_relative 'menu'
require_relative 'text'

class Takeaway

attr_reader :menu, :basket, :subtotal

  def initialize(menu = Menu.new, text_class = Text)
    @menu = menu
    @basket = {}
    @subtotal = []
    @text_class = text_class
  end

  def show_menu
    Menu::ITEMS.each do |item, price|
      puts item.capitalize.ljust(20) + price.to_s.capitalize.rjust(20)
    end
  end

  def order(item, quantity = 1)
    item = item.downcase
    fail 'Not a menu item!' unless menu.on_menu?(item)
    basket.store(item, quantity)
    confirm_order(item, quantity)
    @subtotal << [quantity, item, (quantity * @menu.items[item]).round(2)]
  end

  def itemise
    subtotal.each do |quantity, item, price|
      puts "You have ordered #{quantity} #{item} for a total £#{price.round(2)}"
    end
      puts "Your total bill is £#{total}."
  end

  def total
    total = 0
    basket.each do |item, quantity|
      total += (quantity * (menu.check_price(item)))
    end
    total.round(2)
  end

  def complete_order
    confirm_bill
    @text_class.new.send_message
    @basket = nil
  end

private

  def confirm_order(item, quantity)
    puts "#{quantity} #{item} ordered."
  end

  def confirm_bill
    puts "Your account has been debited £#{total}."
    puts "Delivery confirmation will now be sent to you via SMS."
  end

end
