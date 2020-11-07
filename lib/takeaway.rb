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

end
