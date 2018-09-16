class Order
  attr_accessor :basket

  def initialize
    @basket = {}
  end

  def show_basket
    @basket.each do |item, quantity|
      puts item.format_item + " x #{quantity}"
    end
  end

  def calculate_price

  end

end