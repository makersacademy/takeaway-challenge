require_relative 'menu'

class CurrentOrder

  attr_accessor :customer_order

  def initialize menu = Menu.new
    @customer_order = []
    @menu = menu
    @total = 0
  end

  def order_total
    @total
  end

  def create_order selection, quantity
    customer_order << {selection: selection, quantity: quantity}
    calc_total selection, quantity
  end

  def view_order
    str = ''
    customer_order.each do |arr|
      arr.each_pair do |k,v|
        if k == :selection
          str += "#{v}, Quantity : #{arr[:quantity]} // "
        end
      end
    end
    "#{str} Order Total : £#{order_total.to_s}"
  end

  def reset_order!
    self.customer_order = []
    @total = 0
  end

  private

  def calc_total selection, quantity
    price = ''
    @menu.menu.each {|hsh| price = hsh[selection] if hsh.has_key? selection}
    quantity.times {@total += price.to_f}
  end

end
