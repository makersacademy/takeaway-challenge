require_relative 'item'
require 'csv'

class Menu

  attr_reader :list

  def initialize
    @list = []
  end

  def add(name, price, item = Item.new(name, price))
    @list << item
  end
end
