require_relative 'menu'
require 'date'

class Takeaway

attr_reader :menu, :basket, :subtotal

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @subtotal = []
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
    total
  end

  def check_order
    puts "Would you like to check your order y/n"
    reply = gets.chomp
    if reply == 'y' then itemised_subtotal
    else complete_order end
  end

  def complete_order
    confirm_bill
    confirm_time
    @basket = nil
  end

private

  def confirm_order(item, quantity)
    puts "#{quantity} #{item} ordered."
  end

  def confirm_bill
    puts "That will be £#{total} please."
  end

  def itemised_subtotal
    subtotal.each do |quantity, item, price|
      puts "You have ordered #{quantity} #{item} for a total £#{price}"
    end
  end

end
