require_relative 'list_printer'
#pay for them

class Order
  include ListPrinter

  attr_reader :dishes

  def initialize
  @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def remove(dish)
    raise "Woah there, you haven't ordered this yet" unless dishes.include?(dish)

    dishes.delete(dish)
    self.dishes
  end

  def order_print
    @dishes.uniq.each do |dish|
      amount = dishes.count(dish)
      puts "#{amount} x " + printer(dish)
    end
  end
end
