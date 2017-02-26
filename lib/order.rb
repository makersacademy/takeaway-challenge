class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  # def add_dish(number, menu)
  #   dish = Dish.new(number, menu)
  #   name = dish.get_name(number, menu)
  #   if basket.key?(name)
  #     basket[name] += 1
  #   else
  #     basket[name] = 1
  #   end
  # end

  def add_dish(number, menu)
    dish = Dish.new(number, menu)
    name = dish.name
    if already_in_basket?(name)
      basket.each {|item|
        if item[:name] == name
          item[:quantity] += 1
        end
      }
    else
      price = dish.price
      item = {}
      item[:name] = name
      item[:price] = price
      item[:quantity] = 1
      @basket << item
    end
  end

  def already_in_basket?(name)
    basket.any? {|item|
      item[:name] == name}
  end

  def get_total
    total = 0
    basket.each { |item|
      total += (item[:price] * item[:quantity])
    }
    total
  end
  #
  # def view_basket
  # end

end
