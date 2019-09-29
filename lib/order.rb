require_relative 'takeaway'
require_relative 'menu'

class Order

  attr_accessor :item, :quantity, :in_basket

  def initialize
    @in_basket = []
  end

  def place_order(item, quantity)
    @item = item
    @quantity = quantity
  end

  def find_cost
    MENU_ITEMS.each do |name, price|
      if name == @item
        @in_basket << ('%.2f' % (price * @quantity)).to_f
        puts "#{@quantity} order/s of #{name} = £#{('%.2f' % (price * @quantity).to_f)}"
        puts "Current total = £#{'%.2f' % @in_basket.sum}"
      end
    end
  end
end
