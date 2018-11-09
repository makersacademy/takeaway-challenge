require_relative 'menu'

class Order

  def initialize
    @cost = 0
    @menu = Menu.new
  end

  def add(num)
    @cost += num
    # puts "#{@menu.items[item_number.to_i - 1][:name]} added to basket"
    # puts "current total: £#{cost_total}"
  end

end
