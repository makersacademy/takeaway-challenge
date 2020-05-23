# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
require_relative 'menu'

class Takeaway

  attr_reader :current_order

  def initialize
    @menu = Menu.new
    @current_order = []
  end

  def view
    @menu.view
  end

  def order(num, amount)
    amount.times { @current_order << @menu.select(num)}
  end
end
