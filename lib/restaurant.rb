class Restaurant
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu.display
  end

  def bill(basket)
    total = 0
    basket.each { |key, value|
      value = 0 if value.nil?
      total += (value * @menu[key]) if @menu.key?(key)
    }
    total
  end

end
