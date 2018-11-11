class Order
  attr_reader :items, :varified
  def initialize(menu)
    @items = []
    @menu = menu
    @varified = false
  end

  def varify
    @varified = true
  end

  def create_dish(menu_id, dish = Dish.new)
    selection = @menu.data.select{ |dish| dish[:id] == menu_id }.first
    dish.set_all(selection)
    dish
  end

  def build(id_array)
   @items = id_array.map{ |id| create_dish(id) }
  end

  def print
    string = "Your Order is:\n--------------\n"
    @items.each do |dish|
      string << "#{dish.name} £#{Price::format(dish.price)}\n"
    end
    string << "--------------\n\nTotal: £#{Price::format(total)}"
  end

  def total
    total = 0
    @items.each { |dish| total +=  dish.price }
    total
  end
end
