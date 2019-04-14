require_relative 'menu'

class Order
  attr_reader :selected

  def initialize#(menu = Menu.new.list)
    @selected = Hash.new(0)
  end

  def add(dish, quantity)
    @selected[dish] += quantity
  end




  #
  # def verify
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
  # end

#   def total(amount)
#     @prices = []
#     @dishes.each do |k,v|
#       prices << v
#     end
#
#     @quantity.split(',').each_with_index do |quantity,index|
#       quantity * @prices[index]
#     end
#     amount == @total
#   end
end
