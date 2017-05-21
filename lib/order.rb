require_relative 'menu'
class Order
  attr_reader :selection, :menu_list

  def initialize
    @menu = Menu.new
    @selection = []
    @total = []
  end

  def add_to_order(dish, quantity)
    @selection << { dish => quantity }
  end

  def calculate_price
    selection.each do |choice|
      choice.each do |item, qty|
        @price = @menu.menu_list[item]
        @total << @price *= qty
      end
    end
    @total
  end

  def calculate_total
    sum = 0
    @total.each { |price| sum += price }
    sum
  end
end
