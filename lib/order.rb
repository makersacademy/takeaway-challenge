class Order

  attr_reader :basket, :items

  def initialize
    @basket = {}
    @items = []
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
    if items.any? {|item|
      item[:name] == name
      item[:quantity] += 1}
    else
      price = dish.price
      item = {}
      item[:name] = name
      item[:price] = price
      item[:quantity] = 1
      @items << item
    end
  end

  # def get_total
  #   basket.each { |item, quantity|
  #     item
  #   }
  # end
  #
  # def view_basket
  # end

end
