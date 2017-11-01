class Order

  attr_reader :order, :total, :status

  def initialize
    @order = []
    @total = 0
    @status = :open
  end

  def add_dish(dish)
    @order << dish
    @total += dish.price
  end

  def remove_dish(dish)
    @order.delete(dish)
    @total -= dish.price
  end

  def show
    print_order
  end

private

  def print_order
    print_dishes
    print_status
    print_total
  end

  def print_dishes
    @order.each_with_index do |dish, index|
      puts "#{index+1}. #{dish.description} - £#{dish.price}"
    end
  end

  def print_status
    puts "Order is #{@status.to_s}"
  end

  def print_total
    puts "Total: £#{@total}"
  end

end