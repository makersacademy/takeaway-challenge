require_relative 'list_printer'
# pay for them

class Order
  include ListPrinter

  attr_reader :dishes, :total

  def initialize
    @dishes = []
    @total = 0
  end

  def add(dish)
    update_total(dish)
    @dishes << dish
  end

  def remove(dish)
    raise "Woah there, you haven't ordered this yet" unless dishes.include?(dish)

    dishes.delete(dish)
    dishes
  end

  def review_total
    return puts "Order something first!" unless @dishes.length > 0

    subtotal = 0
    dishes.each { |x| subtotal += x.cost }
    return puts "Order total is correct!" if total == subtotal
  end

  def order_print
    @dishes.uniq.each do |dish|
      amount = dishes.count(dish)
      puts "#{amount} x " + printer(dish)
    end
  end

  private

  def update_total(dish)
    @total += dish.cost
  end
end
