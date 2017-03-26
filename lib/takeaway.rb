require_relative 'menu'

class TakeAway #stores the items in basket
  attr_reader :basket, :menu
  attr_writer :basket


  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def read_menu
    @menu.list_items
  end

  def order(item, quantity = 1)
    raise "That item is not on the menu. Try another dish." unless menu.list_items.key?(item)
    notify(item, quantity)
    basket.delete_if { |i| i.include? item }
    basket << {item => quantity}
  end

  def basket_summary
    basket.collect { |order| "#{order.keys.pop} x #{order.values.pop} = £#{order.values.pop * menu.list_items[order.keys.pop]}" }.join(", ")
  end

  def total
    basket.reduce { |order| order.values}
  end

  private

  def notify(item, quantity)
    "#{quantity}x #{item}(s) added to your basket."
  end

end
