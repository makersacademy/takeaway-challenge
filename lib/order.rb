class Order
  attr_accessor :basket

  def initialize
    @basket = []
  end

  def show_basket
    @basket.each do |item|
      puts item.format_item
    end
  end

  def calculate_price

  end

end