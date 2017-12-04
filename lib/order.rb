class Order
  attr_reader :basket
  attr_accessor :tot

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

  def sum_items
    @basket.inject(0) do|sum, dish|
      sum + (dish[:price] * dish[:quantity])
    end
  end

  def check_sum_items
    sum_items == @tot
  end

  # private
  attr_reader :available_dishes

  def item_by_name(name)
    available_dishes.find { |dish| dish[:name] == name }
  end
end
