class OrderLog

  def initialize menu
    @menu = menu
    @current = []
  end

  def show
    current.inject(''){|sum,item| sum << "#{item.name}: #{item.price}\n"}
  end

  def add dish, quantity = 1
    quantity.times {add_one dish}
  end

  def remove dish_name, quantity = 1
    quantity.times {remove_one dish_name}
  end

  def total
    @current.inject(0) {|sum,item| sum += item.price}
  end





  private
  attr_reader :current

  def add_one dish
    @current << @menu.get(dish)
  end

  def remove_one dish_name
    @current.each_with_index do |dish,index|
      if dish.name == dish_name
        @current.delete_at(index)
        break
      end
    end
  end
end
