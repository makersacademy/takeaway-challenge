require_relative './order.rb'

class Takeaway

  attr_reader :order

  def initialize(dishes = [{pizza: '£9'}, {pasta: '£7'}])
    @dishes = dishes
    @order = []
  end

  def menu
    @dishes
  end

  def add_to_order(choice)
    @dishes.each { |dish| @order << dish if dish.include?(choice.to_sym)}
  end

  def total
    total = 0
    @dishes.each do
      |dish| total += dish.values[0][-1].to_i
    end
    total
  end


end
