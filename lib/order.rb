class Order

  attr_reader :total, :category

  def initialize(category)
    @selected_dishes = []
    @total = 0
    @category = category
  end

  def selected_dishes
    @selected_dishes.dup
  end

  def add(dish, quantity)
    name, price, amount = dish.name, dish.price, quantity
    @selected_dishes << [name, price, amount]
    adjust_total(price, amount)
  end

  def print_order
    selected_dishes.each do |item|
      puts "#{item[2]} x #{item[0]}(£#{'%.2f' % item[1].round(2)})"
    end
    puts "Total: £#{'%.2f' % @total.round(2)}"
  end

  private

  def adjust_total(price, quantity)
    @total += price * quantity
  end

end
