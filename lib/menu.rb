require_relative 'order'
require_relative 'texter'

class Menu
  attr_reader :dishes, :current_order

  def initialize(order_class: Order, texter_class: Texter)
    @dishes = []
    @order_class = order_class
    @texter_class = texter_class
  end

  def add_dish(dish)
    @dishes.each { |item| raise 'dish on menu' if dish.name == item.name }
    @dishes << dish
  end

  def display_menu
    dishes.each_with_index do |dish, index|
      puts "#{index + 1}. #{dish.name}, £#{dish.price}"
    end
  end

  def new_order
    @current_order = @order_class.new
  end

  def order_dish(number, quantity)
    check_order_number(number)
    @current_order.add_to_order({ @dishes[number - 1] => quantity })
  end

  def recite_order
    @current_order.show_order
    @current_order.show_total
  end

  def finish_order
    raise 'start a new_order first brah' if @current_order.nil?
    @texter_class.new.send_text(current_order.find_total)
    @current_order = nil
  end

  private

  def check_order_number(number)
    raise 'please pick the dish number' unless number.is_a? Numeric
    raise 'please stick to numbers on the menu' if number > @dishes.length
  end

end
