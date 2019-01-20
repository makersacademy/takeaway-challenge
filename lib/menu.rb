require 'dotenv/load'
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
  end

  def order(items)
    @orders << Order.new(items)
    @orders[-1].complete?
  end

end
