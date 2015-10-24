class Takeaway

  attr_reader :basket

  def initialize
    @menu = []
    @basket = []
    @total = 0
  end

  def add_dish(name, price)
    @menu << {name => price}
  end

  def show_menu
    @menu.to_s
  end

  def order(name, quantity)
    @basket << {name => quantity}
    puts "#{quantity}x #{name}(s) added to your basket."
  end

end
