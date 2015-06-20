class Takeaway

  attr_reader :menu
  attr_reader :order_list

  def initialize
    @menu = Hash['tempura', 8, 'okonomiyaki', 7, 'yakisoba', 6, 'gyoza', 3]
    @order_list = []
  end

  def show_menu
    @menu
  end

  def order(item, multiple)
    multiple.times { @order_list.push(item) }
  end

  

end