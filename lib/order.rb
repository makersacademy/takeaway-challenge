class Order

  def initialize(list_of_dishes = [{dish_name: nil, dish_price: nil}])
    @list_of_dishes = list_of_dishes
    @order = []
  end

  def price_per_dish
    @item = []
    @list_of_dishes.each do |dish|
      if dish[:dish_name] == 'Vegan Sausages'
        @item << dish[:dish_price]
      end
    end
  end

  def total
    sum = []
    @order.each do |hash|
      if hash[:quantity] == 2
        @item << hash[:quantity]
      end
      sum += dish[:dish_price] * hash[:quantity]
    end
  end
end
