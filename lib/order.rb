class Order

  attr_reader :basket

  MENU = {pizza: 10,
          ice_cream: 5.55,
          garlic_bread: 2.99}

  def initialize
    @basket = Hash.new(0)
  end

  def menu
    MENU
  end

  def add_to_basket(item)
    basket[item.name] += 1
  end

  def total
    basket.keys.map do |food|
      MENU[food]*basket[food]
    end.reduce(:+)
  end
  
  private

  attr_writer :basket

end
