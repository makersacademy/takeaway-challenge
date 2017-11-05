class Takeaway

attr_reader :basket, :list

  def initialize
    @basket = []
    @list = [
      {name: "Chicken", quantity: 1, price: 4.5},
      {name: "Chips", quantity: 1, price: 2},
      {name: "Burger", quantity: 1, price: 6}
      ]
  end

  def menu
    @list
  end

  def order(dish)
    @basket << @list.select { |k| k[:name].include?(dish) }
  end

end
