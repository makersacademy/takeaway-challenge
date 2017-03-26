class Order # Making orders from a menu

attr_reader :dishes

  def initialize(menu)
    @dishes = Hash.new(0)
  end

  def place_order(dish, quantity)

  end


  private

  def order_total
    @dishes.reduce { |quantity, dishes| quantity + dishes }
  end

  def order_complete?

  end

end
