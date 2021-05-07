require_relative 'Menu.rb'

# This new class is going to create an order
class Order

  attr_reader :dishes

  def initialize
    @dishes = []
    @menu = Menu.new
  end

  def add_dish(name, amount)
    @name = name
    @amount = amount
    fail "This disnt isn't available, please run menu.list_dishes to see the dishes" unless available?
    @dishes << { :name => name, :amount => amount }
  end
end