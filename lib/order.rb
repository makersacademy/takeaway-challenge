require_relative 'menu'
class Order
  attr_reader :order, :total_prize

  def initialize
    @menu = Menu.new
    @order = []
    @total_prize = 0
  end

  def add_chicken
    @order << @menu.dishes_list[0]
    @total_prize += @menu.dishes_list[0][:prize]
  end

  def add_lamb
    @order << @menu.dishes_list[1]
    @total_prize += @menu.dishes_list[1][:prize]
  end

  def add_beef
    @order << @menu.dishes_list[2]
    @total_prize += @menu.dishes_list[2][:prize]
  end

  def check_order
    @order << {total: "£#{@total_prize}"}
    @order
  end

end
