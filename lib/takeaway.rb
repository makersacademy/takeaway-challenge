require_relative 'menu'
require_relative 'text'

class Takeaway

attr_reader :menu, :basket, :subtotal, :sms

  def initialize(menu = Menu.new, sms = MessageSender)
    @menu = menu
    @basket = {}
    @subtotal = []
    @sms = sms
  end

  def order(item, quantity = 1)
    item = item.downcase
    fail 'Not a menu item!' unless menu.on_menu?(item)
    basket.store(item, quantity)
    confirm_order(item, quantity)
    @subtotal << [quantity, item, (quantity * @menu.items[item])]
  end

  def total
    total = 0
    basket.each do |item, quantity|
      total += (quantity * (menu.check_price(item)))
    end
    total.round(2)
  end

  def itemised
    subtotal.each do |quantity, item, price|
      puts "You have ordered #{quantity} #{item} for a total £#{price}"
    end
  end

  def complete_order
    confirm_bill
    sms.new
    @basket = nil
  end

private

  def confirm_order(item, quantity)
    puts "#{quantity} #{item} ordered."
  end

  def confirm_bill
    puts "That will be £#{total} please."
  end

end
