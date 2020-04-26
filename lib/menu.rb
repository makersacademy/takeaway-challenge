require './lib/dish_list'
require './lib/twilio'

class OrderMenu
  attr_reader :basket, :dish_list

  #Dependency Injection!
  def initialize(dish_list = DishList.new)
    @dish_list = dish_list
    @basket = Array.new
    @current_selection = Hash.new
  end

  def print
    @dish_list.dishes.each { |dish| puts dish }
  end

  def enter_selection(item, quantity)
    raise "Item not available" unless available?(item)
    add_to_basket(quantity)
    @current_selection = Hash.new
  end

  def place_order(sum)
    raise "No selection made" if @basket.empty?
    check(sum)
  end

  def total
    sum = 0
    @basket.each { |selection| sum += (selection["item"].price * selection["quantity"]) }
    sum
  end

  private
  def available?(item)
    @dish_list.dishes.each { |dish| @current_selection["item"] = dish if dish.item == item }
    !@current_selection["item"].nil?
  end

  def add_to_basket(quantity)
    @current_selection["quantity"] = quantity
    @basket << @current_selection
  end

  def check(sum)
    total == sum ? RubyTwilio.send_confirmation_text : (raise "Incorrect amount")
  end
end
