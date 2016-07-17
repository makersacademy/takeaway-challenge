class TakeAway

  attr_accessor :menu, :basket

  def initialize
    @basket = []

    @menu = {
      :wonton_soup => 2,
      :spring_roll => 2,
      :kung_po => 5,
      :fried_squid => 6,
      :chow_mein => 9,
      :roasted_duck => 9
    }
  end

  def order(dish, number=1)
    new_dish = @menu.select {|k, v| k==dish}
    add_order(new_dish, number)
    "#{number}x #{dish}(s) added to your basket."
  end

  def see_menu
    @menu
  end

  def see_basket
    @basket
  end

  def basket_prices
    @basket_prices = @basket.flat_map(&:values)
  end

  def basket_total
    @basket_prices.reduce { |sum, price| sum + price }
  end

  private

  def add_order(new_dish, number)
    number.times{@basket.push(new_dish)}
  end

end
