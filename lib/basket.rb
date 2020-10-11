class Basket
  attr_reader :dishes, :total_price

  def initialize
    @dishes = Hash.new
    @total_price = 0
  end

  def add(dish, quantity = 1)
    @dishes[dish] = 0 if @dishes[dish].nil?
    @dishes[dish] += quantity
    @total_price += quantity * dish.price
  end

  def place_order(printer = Printer.new, texter = Texter.new, time = Time.new)
    correct_total?
    printer.print_basket(self)
    texter.send_text(confirmation(time))
    clear_basket
  end

  def correct_total?
    raise "Total price is wrong. Please try again." if @total_price != calculate_total

    true
  end

  private

  def confirmation(time)
    "Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.min}"
  end

  def clear_basket
    @dishes.clear
  end

  def calculate_total
    total = 0
    @dishes.each { |dish, quantity| total += quantity * dish.price }
    total
  end
end
