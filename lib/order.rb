require './lib/menulist.rb'
#handles customer orders

class Order
  attr_reader :menu, :orderlist
  def initialize(menu = MenuList.new)
    @menu = menu.get_menu
    @orderlist = []
  end

  def add(index)
    @orderlist << menu[index]
  end

  def complete_order
    orderlist
  end

  def show_menu
    format_list(menu)
  end

  private

  def format_list(list)
    list.each do |dish|
       puts "#{dish[:order_num]}. #{dish[:name]}, price: £#{ "%.2f" % dish[:price]}\n"
    end
  end

end
