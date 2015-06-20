class Takeaway

  attr_reader :menu
  attr_reader :order_list

  def initialize
    #@menu = Hash['tempura', 8, 'okonomiyaki', 7, 'yakisoba', 6, 'gyoza', 3]
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

  end

  def order_total
    @price = 0
    @order_list.each do |x| 
      price += @menu.fetch(x)
    end
    @price

    #in order_list look for the keys (food names) and
    #add the corresponding value to the price variable
  end
end