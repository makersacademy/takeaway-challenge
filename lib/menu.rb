class Menu

  attr_reader :price_list

  def initialize(price_list = Price_list)
    @price_list = price_list
  end

  def print_list
    @price_list
  end

end
