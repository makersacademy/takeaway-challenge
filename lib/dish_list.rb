class DishList
  def initialize
    @dish_list = []
  end

  def add(dish_with_price) 
    @dish_list << dish_with_price
  end

  def list
    @dish_list
  end
  
  def selection

    @dish_list.select do |dish|
      dish.is_selected?
    end

  end

  def receipt
    selection.map do |item|
      item.format
    end.push(grand_total)
  end

  def grand_total
    sum = selection.map do |item|
      item.price
    end.sum

    "Total cost: £#{'%.2f' % sum}"
  end
end
