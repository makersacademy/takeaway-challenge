class Diner

  attr_reader :menu

  def initialize
    @menu = {
      'Pizza'       => 3.00,
      'Ribs'        => 6.00,
      'Ramen'       => 5.00,
      'Fries'       => 2.00,
      'Biscuit'     => 1.00,
      'Hash Browns' => 4.00,
      'Avocado'     => 1.00,
      'Waffle'      => 3.00,
      'Candy'       => 1.00,
      'Taco'        => 2.00
    }
  end

  def print_items
    @menu.each_with_index {
      |(item, price), index| puts "#{index + 1}. #{item} ....... £#{'%.02f' % price}\n"
    }
    puts "To order something, use order_items(quantity, item). Eg. macey.order_items(5, 'Pizza')"
  end

end
