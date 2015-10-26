class Menu

  attr_reader :dishes, :report_price

# should not be hard-coded!
  DEFAULT_MENU = { 'Coffee' => 2.50, 'Tea' => 2.00, 'Beer' => 3.50, 'Wine' => 4.00 }
  ALT_MENU = { 'Waffles' => 3.50, 'Gelato' => 4.00 }

  def initialize(dishes=DEFAULT_MENU)
    @dishes = dishes
  end

  def report_menu
    dishes.each_key { |dish| puts "#{dish} : £#{sprintf('%.2f', dishes[dish])}" }
  end

  def report_price(item)
    dishes[item]
  end

end