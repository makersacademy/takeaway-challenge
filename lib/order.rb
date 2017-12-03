class Order
  attr_reader :available_dishes, :basket

  def initialize(available_dishes)
    @available_dishes = available_dishes
    @basket = []
  end

  def add(name, quantity)
    item = item_by_name(name)

    if item[:quantity] > quantity
      @basket << { name: name, price: item[:price], quantity: quantity }
    else
      "Sorry, we do not have enough quantity "
    end
  end

  private
  def item_by_name(name)
    available_dishes.find { |dish| dish[:name] == name }
  end

end
