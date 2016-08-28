require "./lib/menu.rb"
class Order

  attr_reader :basket, :item, :menu, :quantity

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def order_item(item, quantity=1)
    @item = item.to_sym
    @quantity = 1
    check_item(@item)
    @basket[@item] = quantity
    @basket
  end

  def check_item(item)
    fail "Sorry, that item is not on the menu" unless menu.list.key?(item)
  end

  def total_price
  calcul_total.inject(:+)
  end

  def print_total
   str = "You ordered "
   @basket.each do |k, v|
     str << "#{v.to_i} "
     str << "#{k.to_s}"
     str << " ** "
    end
    str << "Total is #{total_price}"
  end

  private
  def calcul_total
    @basket.map do |k, v|
      v * menu.list[k]
    end
  end

end
