require_relative 'price_error'

class Order

  def initialize
    @order = []
  end

  def add(dish_price_quantity)
    @order << dish_price_quantity
    printer
  end

  def confirm(price)
    raise PriceError unless price == total_cost
    
  end


  private

  def printer
    three_new_lines
    puts "Current order:"
    one_new_line
    @order.each do |dish|
      puts "#{dish[:quantity]} #{dish[:name]}"
    end
    one_new_line
    puts "Total: #{total_cost} silver sickles"
    three_new_lines
  end

  def total_cost
    total = 0
    @order.each do |dish|
      total += dish[:quantity] * dish[:price]
    end
    total
  end

  def three_new_lines
    puts "\n\n\n"
  end

  def one_new_line
    puts "\n"
  end

end
