require './lib/dish_list'

class Menu
  attr_reader :basket, :dish_list

  def initialize
    @dish_list = DishList.new
    @basket = Array.new
    @current_selection = Hash.new
  end

  def print
    @dish_list.dishes.each { |dish| puts dish }
  end

  def enter_selection(item, quantity)
    raise "error" unless available?(item)
    add_to_basket(quantity)
    @current_selection = Hash.new
  end

  def place_order(sum)
    check(sum)
  end

  def total
    sum = 0
    @basket.each do |selection|
      sum += (selection["item"].price * selection["quantity"])
    end
    sum
  end

  private
  def available?(item)
    @dish_list.dishes.each do |dish|
      @current_selection["item"] = dish if dish.item == item
    end
    !@current_selection["item"].nil?
  end

  def add_to_basket(quantity)
    @current_selection["quantity"] = quantity
    @basket << @current_selection
  end

  def check(sum)
    total == sum ? "success!" : (raise "error")
  end
end
