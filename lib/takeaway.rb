require_relative 'menu'

class Takeaway

attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def order(item, quantity = 1)
    item = item.downcase
    fail 'Not a menu item!' unless menu.on_menu?(item)
    basket.store(item, quantity)
    confirm_order(item,quantity)
  end

  def total
    total = 0
    basket.each do |item, quantity|
      total += (quantity * (menu.check_price(item)))
    end
    total
  end

private

  def confirm_order(item, quantity)
    puts "#{quantity} #{item} ordered."
  end

  def confirm_bill
    puts "That will be £#{total} please."
  end

end
