class Takeaway

  attr_reader :menu, :basket

  def initialize(menu)
    @menu = menu
    @basket = []
  end

  def print_menu
    @menu.print_menu
  end

  def add_item(item, amount = 1)
    item = @menu.menu.select { |name| item == name.to_s }
    item.map { |x, y| puts "#{amount} x #{x}, item total = £#{y * amount}" }
    amount.times { @basket << item }
  end

  def print_total
    @total = []
    @basket.each { |h| h[:burger]
        h.select { |x,y| @total << y}
   }
    @total.sum
  end

  def checkout
    puts "In your basket is #{@basket} and you're current total is £#{print_total}"
  end

end
