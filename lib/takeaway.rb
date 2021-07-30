# require_relative 'menu'

class Takeaway
  attr_reader :order, :total

  def initialize
    @order = []
    @total = 0
  end
  
  def show_menu
    menu.display_menu
  end

  def select_meal(choice)
    @order.push(choice)
  end

  def order_total
    @total
  end

  # def calculate_fee
  #   # @menu.each do |key, value| 
  #   #   if key.include? @order
  #   #   @total = value.sum
  #   #   else 
  #   #   end
  #   end
end
