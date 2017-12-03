class Order
attr_reader :order
  def initialize(menu = Menu.new)
    @order = []
    @menu = menu
    @total_price
  end

  def request_item(*item)
    item.each do |item|
      @order << @menu.choose_item(item)
    end

  end

  def total_price
    @total_price = @order.map{|items| items.values}.flatten.reduce(:+)
  end

end
