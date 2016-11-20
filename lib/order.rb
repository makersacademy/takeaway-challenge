require_relative 'dishes_list'

class Order

  LINE_WIDTH = 60

  attr_reader :dishes_list, :total, :ordered_dishes

  def initialize(dishes_list)
    @dishes_list = dishes_list
    @total = 0
    @ordered_dishes = []
  end


  def add(dish, quantity)
    raise "Cannot add. No such dish on the menu." if doesnt_exist?(dishes_list, dish)
    price = calculate(dish, quantity)
    add_to_ordered(dish, quantity, price)
    self.total += price
  end

  def show_order
    print format_order
  end

  def correct?
    calculated_total = 0
    ordered_dishes.each { |dish| calculated_total += (dish[:price]  * dish[:quantity]) }
    total == calculated_total
  end

  def remove_ordered(dish_index_from_order)
    raise "Cannot add. No such dish in your order." if doesnt_exist?(ordered_dishes, dish_index_from_order)
    ordered_dishes.delete_at(dish_index_from_order - 1)
  end

  private
  attr_writer :total, :ordered_dishes

  def calculate(dish, quantity)
    (dishes_list[dish - 1])[:price] * quantity
  end

  def add_to_ordered(dish, quantity, price)
    self.ordered_dishes << ((dishes_list[dish - 1]).merge({:quantity=>quantity, :total=>price }))
  end

  def doesnt_exist?(list, dish)
    (list[dish - 1]) == nil
  end

  def format_order
    formatted = "YOUR ORDER:".center(LINE_WIDTH) + "\n\n"
    n = 1
    ordered_dishes.each do |dish|
      formatted += ("#{n}. #{dish[:dish]}  £#{dish[:price]} x #{dish[:quantity]}").ljust(LINE_WIDTH/2) + "= £#{dish[:total]}".rjust(LINE_WIDTH/2) + "\n"
      n += 1
    end
    formatted += "TOTAL:  £#{total}".rjust(LINE_WIDTH) + "\n\n"
  end

end
