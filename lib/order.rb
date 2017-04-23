class Order

  def initialize(print = Print.new, menu = Menu.new)
    @print = print
    @menu = menu
    @items = Hash.new(0)
    @running_total = @items.clone
    @total = 0
  end

  def add(dish, quantity = 1)
    @items[dish] += quantity
    @running_total[dish] += quantity
    add_to_total
    @print.add_to_basket(dish, quantity)
  end

  def total(input)
    raise @print.incorrect_total(@total) unless correct?(input)
    @print.print_total(@total)
  end

  def basket
    @items.each do |dish, quantity|
      price = @menu.cuisine[dish] * quantity
      @print.view_basket(quantity, dish, price)
    end
  end

  private

  attr_reader :items

  def add_to_total
    @running_total.each do |dish, quantity|
      @price = @menu.cuisine[dish] * quantity
      @running_total.delete(dish)
      end
    @total += @price
  end

  def correct?(input)
    input == @total
  end

end
