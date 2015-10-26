require './lib/menu'

class Order

  attr_reader :menu, :menu_klass, :order
  attr_accessor :output

  def initialize menu, menu_klass=Menu
    @menu = menu
    @menu_klass = menu_klass
    @order = []
    @total = 0
  end

  def pick_menu_item menu_item,quantity=1
    quantity.times do
      order << menu.read(menu_item)
    end
  end

  def total
    order.inject(0) {|memo,item| memo + item.price}
  end

  def print_dishes
    @output = ""
    order.each do |item|
      self.output += "#{item.menu_id}. #{item.name} (£#{item.price})\n"
    end
    output
  end

end