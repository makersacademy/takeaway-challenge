require_relative 'menu'

class Order

  attr_reader :order, :total, :status, :menu

  def initialize(menu = nil)
    @order = []
    @total = 0
    @status = :open
    @menu = menu
  end

  def add_dish(dish)
    raise("Invalid dish number") unless dish_in_menu?(dish)
    update_order(dish, :add)
  end

  def remove_dish(dish)
    raise("Dish not in order") unless dish_in_order?(dish)
    update_order(dish, :remove)
  end

  def show
    print_order
  end

private

  def update_order(dish, request)
    update_add(dish) if request == :add
    update_remove(dish) if request == :remove
  end

  def update_add(dish)
    @order << dish
    @total += dish.price
  end

  def update_remove(dish)
    @order.delete(dish)
    @total -= dish.price
  end

  def dish_in_menu?(dish)
    @menu.in_menu?(dish)
  end

  def dish_in_order?(dish)
    @order.include?(dish)
  end

  def print_order
    print_dishes
    print_status
    print_total
  end

  def print_dishes
    @order.each_with_index do |dish, index|
      puts "#{index + 1}. #{dish.description} - £#{dish.price}"
    end
  end

  def print_status
    puts "Order is #{@status}"
  end

  def print_total
    puts "Total: £#{@total}"
  end

end
