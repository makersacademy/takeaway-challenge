require_relative 'dishes_list'

class Order
  
  attr_reader :dishes_list, :total, :basket

  def initialize(dishes_list = DishList::DISHES)
    @dishes_list = dishes_list
    @total = 0
    @basket = []
  end


  def add(dish, quantity)
    raise NoItemError, "Cannot add. No such dish on the menu." if doesnt_exist?(dishes_list, dish)
    price = calculate(dish, quantity)
    add_to_ordered(dish, quantity, price)
    self.total += price
  end

  def correct?
    calculated_total = 0
    basket.each { |dish| calculated_total += (dish[:price]  * dish[:quantity]) }
    total == calculated_total
  end

  def remove_items(dish_index_from_order)
    raise NoItemError, "Cannot remove. No such dish in your order." if doesnt_exist?(basket, dish_index_from_order)
    self.total -= (basket[dish_index_from_order - 1])[:total]
    basket.delete_at(dish_index_from_order - 1)
  end

  def format_order
    formatted = "YOUR ORDER:".center(60) + "\n\n"
    n = 1
    basket.each do |dish|
      formatted += ("#{n}. #{dish[:dish]}  £#{dish[:price]} x #{dish[:quantity]}").ljust(50) + "= £#{dish[:total]}".rjust(10) + "\n"
      n += 1
    end
    formatted += "TOTAL:  £#{total}".rjust(60) + "\n\n"
  end

  def empty?
    basket == []
  end

  private
  attr_writer :total, :basket

  def calculate(dish, quantity)
    (dishes_list[dish - 1])[:price] * quantity
  end

  def add_to_ordered(dish, quantity, price)
    self.basket << ((dishes_list[dish - 1]).merge({:quantity=>quantity, :total=>price }))
  end

  def doesnt_exist?(list, dish)
    (list[dish - 1]) == nil
  end

end

class NoItemError < StandardError; end
