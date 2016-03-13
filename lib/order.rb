class Order
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def show_basket
    bask = []
    @basket.each do |dish, quant|
      bask << "#{dish} x#{quant} = #{@menu.price dish.to_sym}"
    end
    bask.join(', ')
  end

  def add(dish, quant = 1)
    dish = dish.to_sym
    if @menu.contains? dish
      @basket[dish] += quant
      "#{quant}x #{dish}(s) added to your basket."
    end
  end

  def remove(dish, quant = 1)
    dish = dish.to_sym
    if has? dish
      @basket[dish] -= quant
      @basket.delete dish if @basket[dish] == 0
    end
  end

  def total
    total = 0
    @basket.each { |dish, quant| total += (@menu.price dish.to_sym) * quant }
    total
  end

  def complete_order(money)
    raise 'wrong amount' unless money == total
    true
  end

  private

  def has?(dish)
    @basket.include? dish
  end
end
