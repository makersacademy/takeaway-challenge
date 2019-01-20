require './lib/order.rb'

class Menu

  attr_reader :dishes, :dish_list, :orders

  def initialize(dishes)
    @dishes = dishes
    @dish_list = []
    @orders = []
  end

  def list_dishes
    @dishes.each do |hash|
       @dish_list << "#{hash[:item]} - £#{hash[:price]}"
    end
    puts @dish_list
  end

  #list of dishes, their quantities
  def order(items)
    @orders << Order.new(items)
    puts @orders
    puts @orders[-1]
    @orders[-1].complete?
  end


end
