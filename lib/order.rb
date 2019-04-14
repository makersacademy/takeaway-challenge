require_relative 'menu'

class Order
  attr_reader :selected

  def initialize(menu = Menu.new.dishes)
    @selected = Hash.new(0)
    @menu = menu
  end

  def add(dish, quantity)
    @selected[dish.to_sym] += quantity
  end

  def total
    total = 0
    @selected.each do |dish, quantity|
      total += quantity * @menu[dish]
    end
    "Your order total is £#{total}"
  end

  #   @dishes.map do |k,v|
  #     @dishes[k] = [v]
  #   end
  #   @dishes
  #
  #   @quantity.map do |order|
  #     order[0]
  #   end
  #   #order[0] is name. if dishes include? name then @dishes[name] << order[1]
  #   #order = {}
  #   #order << the included ones

#     @quantity.split(',').each_with_index do |quantity,index|
#       quantity * @prices[index]
#     end
#     amount == @total
#   end
end
