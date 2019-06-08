class Order

  def initialize
    @choices = []
  end

  def add(dish, quantity = 1)
    @choices << {dish => quantity}
  end

  def get(index)
    all[index]
  end

  def summary

    all.map { |item| "#{item.keys[0].name} #{item.keys[0].price} x #{item.values[0]}"}.join"\n" 
  
  
  end

  private

  def all
    @choices
  end

end