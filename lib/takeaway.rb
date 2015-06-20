class Takeaway

  attr_reader :menu
  attr_reader :order_list
  attr_reader :total_price

  def initialize  
    @menu = { 'tempura'     => 8,
              'okonomiyaki' => 7,
              'yakisoba'    => 6,
              'gyoza'       => 3
            }
    @order_list = []
  end

  def show_menu
    @menu
  end

  def order(item, multiple)
    multiple.times { @order_list.push(item) }
  end

  def check_price(price)
    (price == order_total)? true : false
  end

  def order_total
    @total_price = 0
    @order_list.each do |x| 
      @total_price += @menu.fetch(x)
    end
    @total_price
  end

  def order_confirm
    #fail 'Please check the price again' if check_price == false
  end
end