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
      string << "#{dish.name} £#{format_price(dish.price)}\n"
    end
    string << "--------------\n\nTotal: £#{format_price(total)}"
  end

  def total
    total = 0
    @items.each { |dish| total +=  dish.price }
    total
  end

  private
  def format_price(pence)
    pence_array = arrayify_pence(pence)
    if less_than_pound?(pence)
      2.times { pence_array.unshift("0") }
      add_decimal_point(pence_array)
    else
      add_decimal_point(pence_array)
    end
  end

  def add_decimal_point(pence_array)
    pence_array.insert(-3, '.').join
  end

  def arrayify_pence(pence)
    pence.to_s.chars
  end

  def less_than_pound?(pence)
    pence.to_s.size <= 2
  end
end
