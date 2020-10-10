class Basket
  attr_reader :dishes, :total_price
  def initialize
    @dishes = Hash.new
    @total_price = 0
  end

  def add(dish, quantity = 1)
    @dishes[dish] = 0 if @dishes[dish].nil?
    @dishes[dish] += quantity
    @total_price += quantity*dish.price
  end

  def correct_total?
    raise "Total price is wrong. Please try again." if @total_price != calculate_total
    true
  end

  def place_order
    clear_basket
    send_confirmation
  end

  private

  def send_confirmation
    "Thank you! Your order was placed and will be delivered before 18:52"
  end

  def clear_basket
    @dishes.clear
  end

  def calculate_total
    total = 0
    @dishes.each { |dish, quantity| total += quantity*dish.price}
    total
  end
end