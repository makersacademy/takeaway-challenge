require_relative 'dishes_list'

class Order

  LINE_WIDTH = 80

  attr_reader :dishes_list
  attr_reader :total, :ordered_dishes

  def initialize(dishes_list)
    @dishes_list = dishes_list
    @total = 0
    @ordered_dishes = []
  end


  def add(dish, quantity)
    price = calculate(dish, quantity)
    add_to_ordered(dish, quantity, price)
    self.total += price
  end

  def format_order
    formatted = "YOUR ORDER:".center(LINE_WIDTH) + "\n\n"
    n = 1
    ordered_dishes.each do |dish|
      dish.each do |k, v|
        case k
        when :dish; formatted += "#{n}. #{v}".ljust(LINE_WIDTH/2)
        when :price; formatted += "£#{v}"
        when :quantity; formatted += " x #{v}"
        when :total; formatted += "= £#{v}".rjust(LINE_WIDTH/2) + "\n"
        end
      end
      n += 1
    end
    formatted += "TOTAL:  £#{total}".rjust(LINE_WIDTH) + "\n\n"
  end

  def show_order
    print format_order
  end

  private
  attr_writer :total, :ordered_dishes

  def calculate(dish, quantity)
    (dishes_list[dish - 1])[:price] * quantity
  end

  def add_to_ordered(dish, quantity, price)
    self.ordered_dishes << ((dishes_list[dish - 1]).merge({:quantity=>quantity, :total=>price }))
  end

end
