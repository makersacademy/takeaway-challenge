class Menu

  def initialize(dish, price)
    @dish = dish
    @price = price
  end

  attr_reader :dish, :price

  def show
    "#{dish}, #{price}"
end
end
