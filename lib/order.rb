class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def view_basket
    @basket.each { |line| puts "#{line[:qty]}x #{line[:item]} @ £" + "%.2f" % @menu.menu_list[line[:item]] }
  end

end
