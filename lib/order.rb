require_relative 'add_delete'

class Order
  include AddDelete

  def initialize(dishes = [])
    @dishes = dishes
  end

  def dishes
    @dishes.dup
  end

  def view
    dishes.uniq.each do |dish|
      puts summary(dish)
    end
    puts "Total = £#{total}"
  end

  def add(*dishes)
    add_all(dishes, @dishes)
  end

  def delete(*dishes)
    delete_all(dishes, @dishes)
  end

  def total
    dishes.map(&:price).inject(&:+)
  end

  private

  def quantity(dish)
    dishes.count(dish)
  end

  def summary(dish)
    "#{dish} x#{quantity(dish)} = £#{dish.price * quantity(dish)}"
  end

end
