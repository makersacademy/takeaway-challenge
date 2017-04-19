class Order

  attr_reader :basket, :total

  def initialize()
    @total = 0
    @basket = Hash.new
  end

  def select_dish(dish:, quantity:, price:)
    @dish = dish
    @quantity = quantity
    @price = price
    already_in_basket? ? update_basket : add_to_basket
    update_total
  end

  def clear_basket
    self.basket.clear
    self.total = 0
  end

  private

  attr_writer :basket, :total
  attr_reader :dish, :quantity, :price

  def already_in_basket?
    basket.include? dish
  end

  def update_basket
    self.basket[dish] += quantity
  end

  def add_to_basket
    self.basket.store(dish, quantity)
  end

  def update_total
    self.total += (price * quantity)
    nil
  end

end
