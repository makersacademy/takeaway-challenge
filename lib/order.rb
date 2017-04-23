class Order

  def initialize(print = Print.new, menu = Menu.new)
    @print = print
    @menu = menu
    @basket = Hash.new(0)
    @basket_total = @basket.clone
    @total = 0
  end

  def add(dish, quantity = 1)
    @basket[dish] += quantity && @basket_total[dish] += quantity
    add_to_total
    @print.add_to_basket(dish, quantity)
  end

  def total(input)
    raise @print.incorrect_total(@total) unless correct?(input)
    @print.print_total(@total)
  end

  def basket
    @basket.each do |dish, quantity|
      price = @menu.cuisine[dish] * quantity
      @print.view_basket(quantity, dish, price)
    end
  end

  def checkout
    pay
  end

  private

  def pay
    @total = {}
    @basket = {}
  end

  def add_to_total
    @basket_total.each do |dish, quantity|
      @price = @menu.cuisine[dish] * quantity
      @basket_total.delete(dish)
    end
    @total += @price
  end

  def correct?(input)
    input == @total
  end

end
