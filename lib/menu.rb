class Menu


attr_reader :food, :order, :selection

@food = {
  "yum1" => 1,
  "yum2" => 2
}

  def initialize(food = @food)
    @food = food
    @order = []
    @selection = {}
  end

  def

  def print_food
    food.map do |item, price|
      "#{item} : £#{price}"
    end
  end

  def add(item)
    @item = item
    @price = food[@item]
    @selection[@item] = @price
    @order << @selection
    @selection = {}
  end
end
