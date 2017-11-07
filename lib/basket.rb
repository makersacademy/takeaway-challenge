class Basket
  attr_reader :current_order

  def initialize
    @menu = Menu.new
    @current_order = []
    @total = 0
  end

  def add(item_number)
    add_dish(item_number)
  end

  def total
    return_price
  end

  def print_basket
    print_current_basket
  end

  def empty_basket
    @current_order = []
  end

  private

  def add_dish item_number
    @current_order << @menu.dishes.at(item_number - 1) if item_number.abs <= @menu.dishes.length
  end

  def return_price
    @current_order.each do |dish|
      @total += dish.fetch(:price).to_f
    end
    @total
  end

  def print_current_basket
    @current_order.each do |dish|
      puts "#{@current_order.index(dish) + 1}."\
      " #{dish.fetch(:dish)}, £#{'%.2f' % dish.fetch(:price).to_f}"
    end
  end
end
