class Takeaway

  attr_reader :menu_list,
  :basket

  DEFAULT_MENU_LIST = {
    'Napolitana Pizza' => 16.32,
    'Proscuiutto Pizza' => 13.50,
    'Hawaiian Pizza' => 12.35,
    'Quattro Formaggi Pizza' => 10.50,
    'Fiorentina Pizza' => 13.45,
    'Ruspante Pizza' => 11.20,
    'Milano pizza' => 12.60,
    'Gamberoni Pizza' => 8.75,
    'Capricciosa Pizza' => 10.99
  }

  def initialize(menu_list = DEFAULT_MENU_LIST)
    @menu_list = menu_list
    @basket = {}
    @basket.default = 0 # Set default of
  end

  def read
    @menu_list.each { |item, price| "#{item} : #{price}" }
  end

  # assume qty of 1 for item if not specified
  def add_to_order(item, qty = 1)
    raise "#{item} not on the menu" unless @menu_list.include?(item)
    @basket[item] += qty
  end

  def view_basket
    @basket.each { |item, qty| "#{qty} x #{item}" }
  end

end
