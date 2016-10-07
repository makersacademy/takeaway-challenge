require_relative 'menu'

class Selection
  attr_reader :menu, :dishes, :quantity

  def initialize(order_menu)
    @menu = order_menu.list
    @dishes = menu.keys.map(&:to_s)
    @quantity = []
  end

  def select
    puts "Please enter quantity for the items below:"
    dishes.each do |dish|
      puts "#{dish}:"
      @quantity << gets.chomp.to_i
    end
  end

  def review
    price = menu.values
    idx = 0
    quantity.each do |q|
      puts "#{dishes[idx]} @ £#{price[idx]} | #{q} unit | £#{q * price[idx]}"
      idx += 1
    end
      puts "Total sum = £#{calculate_sum(quantity)}"
  end

  private

  def calculate_sum (quantity_record)
    sum = (menu.values).zip(quantity_record)
    sum = sum.map{ |price, quantity| price * quantity}
    sum = sum.reduce(:+)
  end

end
